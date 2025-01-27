use strict;
use warnings;

use Test::More;

use FindBin;
use lib "$FindBin::Bin/lib";

use SPVM 'Fn';
use SPVM 'TestCase::JSON';

my $api = SPVM::api();

my $start_memory_blocks_count = $api->get_memory_blocks_count;


# encode_json
{
  ok(SPVM::TestCase::JSON->encode_json_null);
  ok(SPVM::TestCase::JSON->encode_json_bool);
  ok(SPVM::TestCase::JSON->encode_json_number);
  ok(SPVM::TestCase::JSON->encode_json_string);
  ok(SPVM::TestCase::JSON->encode_json_list);
  ok(SPVM::TestCase::JSON->encode_json_hash);
  ok(SPVM::TestCase::JSON->encode_json_object);
}

# decode_json
{
  ok(SPVM::TestCase::JSON->decode_json_null);
  ok(SPVM::TestCase::JSON->decode_json_bool);
  ok(SPVM::TestCase::JSON->decode_json_number);
  ok(SPVM::TestCase::JSON->decode_json_string);
  ok(SPVM::TestCase::JSON->decode_json_list);
  ok(SPVM::TestCase::JSON->decode_json_hash);
  ok(SPVM::TestCase::JSON->decode_json_invalid_json_data);
}

SPVM::Fn->destroy_runtime_permanent_vars;

my $end_memory_blocks_count = $api->get_memory_blocks_count;
is($end_memory_blocks_count, $start_memory_blocks_count);

done_testing;
