#!/usr/bin/perl

use strict;
use warnings;
use JSON;
use mygengo::mygengo;
use Data::Dumper;

# Get an instance of a mygengo client
# Sandbox
my $mygengo = MyGengo->new('-jf78Pv{q3F3YWWOoO~)B7D0c[Q|FwnDpXRQmy94wXLjFAvAJrB77GPw|M-c(RTy', 'vdR2{~R3xy[$$9ScGIrYNSQekeLj-yPTdEy_[i9Oj4ahtRzXCIeq8ZR-lFSY4RoZ', 'true');
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
