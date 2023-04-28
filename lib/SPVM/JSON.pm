package SPVM::JSON;

our $VERSION = '0.04';

1;

=head1 NAME

SPVM::JSON - JSON

=head1 Description

The JSON class of L<SPVM> has methods to manipulate L<JSON|https://en.wikipedia.org/wiki/JSON>.

=head1 Usage

  use JSON;
  
  # new
  my $json = JSON->new;
  my $json = JSON->new({canonical => 1});
  
  # decode
  my $spvm_data = $json->decode($json_text);
  
  # encode
  my $json_text = $json->encode($spvm_data);

=head1 Fields

=head2 canonical

  method canonical : byte ();

Gets the C<canonical> field.

If this field is a true value, the object keys of JSON created by the L</"encode> method are sorted.

=head1 Class Methods

=head2 new

  static method new : JSON ($options : object[]);

Creates a new L<JSON|SPVM::JSON> object.

Options:

=over 2

=item * C<canonical>

Sets the C<canonical> field.

Default:

1

Exceptions:

The value must be an instance of the L<Int|SPVM::Int> class. Otherwise an exception is thrown.

=back

Exceptions:

If an unsupported option is passed, an exception is thrown.

=head1 Instance Methods

=head2 encode

  method encode : string ($spvm_data : object);

Converts the SPVM data $spvm_data to a JSON data.

A SPVM C<undef> is converted to a JSON C<null>.

A L<Bool|SPVM::Bool> object with the C<value> field of 1 is converted to JSON C<true>.

A L<Bool|SPVM::Bool> object with the C<value> field of 0 is converted to a JSON C<false>.

A SPVM string is converted to a JSON string. C</> in a SPVM string is escaped to C<\/> in a JSON string.

A L<Byte|SPVM::Byte> object is converted to a JSON number.

A L<Short|SPVM::Short> object is converted to a JSON number.

A L<Int|SPVM::Int> object is converted to a JSON number.

A L<Long|SPVM::Long> object is converted to a JSON number. Accuracy may be reduced.

A L<Float|SPVM::Float> object is converted to a JSON number.

A L<Double|SPVM::Double> object is converted to a JSON number.

A L<List|SPVM::List> object is converted to a JSON array.

A L<Hash|SPVM::Hash> object is converted to a JSON object.

=head2 decode

  method decode : object ($json : string);

Converts the JSON data $json to a SPVM data.

A JSON C<null> is converted to a SPVM C<undef>.

A JSON C<true> is converted to a L<Bool|SPVM::Bool> object with the C<value> field of 1.

A JSON C<false> is converted to a L<Bool|SPVM::Bool> object with the C<value> field of 0.

A JSON string is converted to a SPVM string.

A JSON number is converted to a L<Double|SPVM::Double> object. Accuracy may be reduced.

A JSON array is converted to a L<List|SPVM::List> object.

A JSON object is converted to a L<Hash|SPVM::Hash> object.

=head1 Repository

L<SPVM::JSON - Github|https://github.com/yuki-kimoto/SPVM-JSON>

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License
