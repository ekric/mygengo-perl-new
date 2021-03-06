#!/usr/bin/perl

use strict;
use warnings;
use JSON;
use mygengo::mygengo;
use Data::Dumper;

# Get an instance of a mygengo client
# Sandbox
my $mygengo = MyGengo->new('public-key', 'private-key', 'true');
# Live
# my $mygengo = MyGengo->new(public-key', 'private-key', 'false');

# Retrieve basic account information...
my $stats = $mygengo->getAccountStats();
my $balance = $mygengo->getAccountBalance();

print Dumper($balance->{'response'}->{'credits'});

# Post a job to myGengo
my $job = $mygengo->postTranslationJob({
    type => 'text',
    slug => 'Test',
    body_src => 'This is english',
    lc_src => 'en',
    lc_tgt => 'de',
    tier => 'machine'
});

# Check the response, etc.
print Dumper($job);
