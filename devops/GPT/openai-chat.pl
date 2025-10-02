# IThome OpenAI：OpenAI 分為5級。當安全性左移還不夠時。
# 微軟是最早挹注OpenAI的業者，據稱已投入130億美元，擁有OpenAI約49%的分潤權利，且微軟於旗下的眾多服務中都整合了OpenAI技術。而蘋果則是今年6月才宣布與OpenAI合作，並差點成為OpenAI董事會觀察員。至於身為全球最大AI晶片供應商的Nvidia，則一直是OpenAI的供應商與合作夥伴。據傳OpenAI此次打算募集數十億美元，當中Thrive Capital準備投入10億美元，彭博社引述消息來源表示，Nvidia已討論是否要出資1億美元。至於微軟與蘋果的投資金額則不明。https://www.ithome.com.tw/news/164772
# 血汗AI Feeding Machine: Human Resource Powering AI, ex. tagging.
=pod
AI 服務需求
AI / GPU 伺服器是高電力基礎設施，電力需求 10kW ~ 150kW/機櫃，散熱需求包含氣冷式及水冷式，都不是一般企業機房環境可提供的。
AI 基礎設施是高昂的數位資產，需要高可靠度環境（水、電、防火、防震、資安）與專業機房管理支援。
 - 隔震層：懸浮設計，具阻尼器結構，抗七級強震。
AI 服務應用需要高速的地端與雲、網連結資源，滿足企業對AI 服務應用的各種場域需求。
 - https://www.chief.com.tw/idc/aidatacenter/
 - 是方電訊公布114年上半年度營收20.8億元、EPS 8.24元雙破紀錄的亮眼財報，展現強勁的營收與獲利成長動能，也再次驗證市場領導地位。隨著AI技術迅速發展，高階GPU伺服器對電力與散熱提出更高要求，傳統機房已難以因應。AI基礎設施投資成本高，企業更需仰賴擁有水電、防火、防震、資安與專業管理等全方位機能的資料中心支援。
 - 目前市場上對於如 GB200、GB300 等高階AI伺服器的水冷環境需求日益升高，但供給明顯不足。是方聯雲智能資料中心（LY2）在水冷、高電力、高承載三大技術面布局已久，能提供最快速、最穩定的AI基礎設施，尤其是新推出的「國際級中立水冷AI資料中心拎包入住服務方案」，更是企業切入AI服務和應用的最佳選擇。企業只需自備AI伺服器，即可即時進駐，省去建置機房的繁瑣流程，並透過TPIX快速連接全球：直接串連台灣最大的網際網路交換中心TPIX，與雲端交換中心CCX。
 - 在擁抱AI帶來的巨大潛力的同時，我們也必須正視隨之而來的資安風險。從歐盟《人工智慧法》到台灣金管會發布的金融業運用AI指引，都明確指出AI資安的重要性。為應對這些新型挑戰，是方電訊攜手Cymetrics推出的「Vulcan Attack-AI大型語言模型資安檢測服務」，協助各組織在AI應用的早期階段，即時發現並修補大型語言模型及其應用程式中潛藏的漏洞，大幅降低資安風險。
AWS亦宣布推出推動「零介入科技推動計畫（Taiwan Zero-intervention Technology，簡>稱ZIP）」，此計畫與即將推出的區域級資料中心相輔相成，將涵蓋四面向，例如，跨域人
才培育，預計推動二萬人次的育成，其次，複製高雄的創新實證計畫到其他區域，協助應>用落地，第三，針對產業轉型並提供諮詢，最後希望有機會帶領產業出海。
 - https://tw.stock.yahoo.com/news/aws%E5%9C%A8%E5%8F%B0%E6%8E%A8zip%E8%A8%88%E7%95%AB-%E6%B6%B5%E8%93%8B%E5%9B%9B%E9%9D%A2%E5%90%91-201000051.html
=cut
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
