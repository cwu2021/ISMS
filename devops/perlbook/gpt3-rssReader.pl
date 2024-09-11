#!/usr/bin/perl
# Here is a possible code for an rss reader in Perl running in terminal:
# 不允許的 XML 字元 (其實就三個) https://learn.jamf.com/zh-TW/bundle/technical-articles/page/Entity_Equivalents_for_Disallowed_XML_Characters.html
# Editing XML with notepad++：去官網抓portable與中性版本 https://quamai.blogspot.com/2016/09/notepadxml.html?m=1
use strict;
use warnings;
use XML::RSS;
use LWP::Simple;
use Term::ANSIColor;

# Define the RSS feeds to read
my @feeds = (
"https://www.bbc.com/news/rss.xml",
"https://www.nytimes.com/svc/collections/v1/publish/https://www.nytimes.com/section/world/rss.xml",
"https://feeds.reuters.com/reuters/topNews"
);

# Loop through each feed
foreach my $feed (@feeds) {
# Fetch the feed content
my $content = get($feed);
die "Could not get $feed" unless defined $content;

# Parse the feed content
my $rss = XML::RSS->new;
$rss->parse($content);

# Print the feed title and link
print color("bold blue");
print $rss->{channel}->{title}, "\n";
print color("reset");
print $rss->{channel}->{link}, "\n\n";

# Print the feed items
foreach my $item (@{$rss->{items}}) {
# Print the item title and link
print color("bold green");
print $item->{title}, "\n";
print color("reset");
print $item->{link}, "\n\n";
}

# Print a separator
print "-" x 80, "\n\n";
}
