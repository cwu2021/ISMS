# - perl weekly 2024-07-08
# https://curtispoe.org/articles/an-openai-chatbot-in-perl.html
use v5.40.0;
use experimental qw( class );

class OpenAI::Chat;

use OpenAPI::Client::OpenAI;
use Data::Printer;
use Carp qw( croak );
use utf8::all;

# these parameters are optional
field $model        :param = 'gpt-3.5-turbo-0125';
field $temperature  :param = .1;
field $context_size :param = 16384; # roughly

# For this example, you must pass a system message. However,
# for production code, you probably want a default one.
field $system_message :param :reader; # no default for this one

# we use $history to track the full history of the conversation, including
# token usage. The LLM is stateless. I cannot remember your conversation,
# so we send the full conversation to the LLM each time.
field $history = [];
field $openai  = OpenAPI::Client::OpenAI->new;

method _get_messages ($message) {
  my @messages = map { $_->{messages}->@* } $history->@*;
  if ($system_message) {
    # we always add the system message to the front so that the LLM can
    # understand how it's supposed to behave.
    unshift @messages, { role => 'system', content => $system_message };
  }
  push @messages, $self->_format_user_message($message);
  return \@messages;
}

method _format_user_message ($message) {
  return { role => 'user', content => $message };
}

method _total_tokens () {
  my $total_tokens = 0;
  for my $entry ( $history->@* ) {
    $total_tokens += $entry->{usage}{total_tokens};
  }
  return $total_tokens;
}

method _trim_messages_to_context_size () {
  while ( $self->_total_tokens > $context_size ) {
    # remove the oldest messages first
    shift $history->@*;
  }
}

method prompt ($prompt) {
  my $response = $openai->createChatCompletion(
    {
      body => {
        model       => $model,
        messages    => $self->_get_messages($prompt),
        temperature => $temperature,
      }
    }
  );
  if ( $response->res->is_success ) {
    my $result;
    try {
      my $json    = $response->res->json;
      my $message = $json->{choices}[0]{message};
      my $usage   = $json->{usage};

      # Note that the response will also have rate limiting headers. For
      # casual usage, you shouldn't hit rate limits, so we've omitted this
      # here to keep the example simpler.
      push $history->@* => {
        # track the messages *and* the token usage so we can
        # keep track of our context size
        messages => [
          $self->_format_user_message($prompt),
          $message,
        ],
        usage => $usage,
      };
      $result = $message->{content};
      $self ->_trim_messages_to_context_size;
    }
    catch ($e) {
      croak("Error decoding JSON: $e");
    }
    return $result;
  }
  else {
    my $error = $response->res;
    croak( $error->to_string );
  }
}

method _data_printer {
  my $details = {
    model      => $model,
    system_message => $system_message,
    temperature    => $temperature,
    context_size   => $context_size,
    history        => $history,
  };
  return np $details;
}
