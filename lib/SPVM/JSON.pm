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

=item C<canonical>

Sets the C<canonical> field.

Default:

1

Exceptions:

The value must be an instance of the C<Int|SPVM::Int> class. Otherwise an exception is thrown.

=back

Exceptions:

If an unsupported option is passed, an exception is thrown.

=head1 Instance Methods

=head2 encode

  method encode : string ($object : object);

Converts the given SPVM data structure (undef or a object of numeric,
L<string>, L<SPVM::JSON::Bool>, L<SPVM::Hash> or L<SPVM::ObjectList>)
to its JSON representation.

C</> in a string is escaped to C<\/>.

=head2 decode

  method decode : object ($json : string);

The opposite of encode: expects a JSON text and tries to parse it, returning
the resulting object. Dies on error. Numbers in a JSON text are converted
to L<SPVM::Double>.

=head1 Repository

L<SPVM::JSON - Github|https://github.com/yuki-kimoto/SPVM-JSON>

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License
