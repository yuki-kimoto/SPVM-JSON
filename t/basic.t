use strict;
use warnings;

use Test::More;

use FindBin;
use lib "$FindBin::Bin/lib";

use SPVM 'TestCase::JSON';

# Start objects count
my $start_memory_blocks_count = SPVM::api->get_memory_blocks_count();

# encode
{
  ok(SPVM::TestCase::JSON->encode_null);
  ok(SPVM::TestCase::JSON->encode_bool);
  ok(SPVM::TestCase::JSON->encode_number);
  ok(SPVM::TestCase::JSON->encode_string);
  ok(SPVM::TestCase::JSON->encode_list);
  ok(SPVM::TestCase::JSON->encode_hash);
}

# decode
{
  ok(SPVM::TestCase::JSON->decode_null);
  ok(SPVM::TestCase::JSON->decode_bool);
  ok(SPVM::TestCase::JSON->decode_number);
  ok(SPVM::TestCase::JSON->decode_string);
  ok(SPVM::TestCase::JSON->decode_list);
  ok(SPVM::TestCase::JSON->decode_hash);
}

# All object is freed
my $end_memory_blocks_count = SPVM::api->get_memory_blocks_count();
is($end_memory_blocks_count, $start_memory_blocks_count);

done_testing;
