package SPVM::JSON::Number;



1;

=head1 Name

SPVM::JSON::Number - JSON Number

=head1 Description

The JSON::Number class of L<SPVM> has methods to manipulate a JSON number.

=head1 Usage

  use JSON::Number;

=head1 Fields

  has number : ro string;

Gets the C<number> field.

=head1 Class Methods

  static method new : JSON::Number ($number : string);

Creates a new L<JSON::Number|SPVM::JSON::Number> object with a number string $number.

=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License
