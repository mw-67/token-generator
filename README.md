# README

Simple, pattern based token generator.

Tokens are described by a pattern, that must not contain alphabetic
lower case ascii characters ('a'-'z') except:
 * lower case 'c' which is replaced by a random upper case character.
 * Other lower case characters are reserved for future extensions.

Other characters are preserved.

So a pattern 'FOO-cc-cc:cc-123' translates into a token such as
"FOO-VH-ZW:GC-123".

Basic usage:

    generator = TokenGenerator.new(pattern)
	generator.token

`TokenGenerator::Pattern` can be used to generate pattern using a number
of segments, a segment size and a seperator. E.g.
`TokenGenerator::Pattern.new(segments: 2, segment_size: 4, seperator: '--').to_s` provides `"cccc--cccc"`.
