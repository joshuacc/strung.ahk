# strung.ahk

A utility library for working with strings in AutoHotkey 2

## Installation

The recommended approach for installation is to use [ahkpm][].

```
ahkpm install gh:joshuacc/strung.ahk

# Run the following to get the #Include statement to put into your files
ahkpm include gh:joshuacc/strung.ahk
```

## Usage

Strung.ahk has an extensive set of utility methods for manipulating strings.
You can use these utilities in two different ways.

Firstly, you can use the static methods. These each require passing in the
string you are operating on as the first argument. For example:

```autohotkey
; This path may be different on your system
#Include %A_ScriptDir%\ahkpm-modules\github.com\joshuacc\strung.ahk\strung.ahk

Strung.leftPad("abc", 3)
; => "   abc"
```

Secondly, you can use the instance methods avilable on the chaining API, and use
`.value()` to get the final result.

```autohotkey
; This path may be different on your system
#Include %A_ScriptDir%\ahkpm-modules\github.com\joshuacc\strung.ahk\strung.ahk

Strung("abc").leftPad(3).value()
; => "   abc"
```

### Chaining API

Why use the chaining API? When performing multi-step operations on strings, it
allows you to avoid keeping track of intermediate results, and also lets you
list the order of operations in a straightforward way.

For example:

```autohotkey
Strung("abcdefg").truncate(3).toUpperCase().surround("~").value()
; => "~ABC~"
```

Rules for the chaining API:

1. When using the chaining API, you must omit the `str` parameter found in the
   static API method
2. Use `.value()` to get the final result after a series of string operations.
3. Any methods that return a non-string value (such as `.length()`)  will end
   the chain.

### Static API

#### Strung.at(str, index)

Returns the character found at the specified index. For example, `Strung.at("abc", "b")` returns `2`.

#### Strung.concat(str, others*)

Returns `str` concatenated with the additional arguments supplied. For example, `Strung.concat("a", "b", "c")` returns `"abc"`.

Can also accept an array rather than a series of arguments. As in `Strung.concat("a", ["b", "c"])`.

#### Strung.endsWith(str, suffix)

Returns a boolean indicating whether `str` ends with the specified `suffix`. For example, `Strung.endsWith("xyz", "z")` returns `true`.

#### Strung.contains(str, search)

Returns a boolean indicating whether `str` contains the specified `search` string. For example, `Strung.contains("Of Mice and Men", "and")` returns `true`.


#### Strung.includes(str, search)

An alias for `Strung.contains()`. See above.

#### Strung.indexOf(str, search, fromIndex := 1)

Returns the index where the specified `search` string is found in `str`, or `0` if it is not found. The `fromIndex` indicates what index the search should start at.

For example, `Strung.indexOf("alpha", "a", 3)` returns `5`.

#### Strung.lastIndexOf(str, search)

Returns the index of the specified `search` strint last occurs in `str`, or `0` if it is not found.

For example, `Strung.lastIndexOf("abbott", "b")` returns `3`.

#### Strung.padEnd(str, targetLength, padString := " ")

Returns the result of padding the end of `str` with `padString` (`" "` by default) until it is `targetLength` long. For example, `Strung.padEnd("abc", 3, "-")` returns `"abc---"`.

#### Strung.rightPad(str, targetLength, padString := " ")

An alias for `Strung.padEnd()` see above.

#### Strung.padStart(str, targetLength, padString := " ")

Returns the result of padding the beginning of `str` with `padString` (`" "` by default) until it is `targetLength` long. For example, `Strung.padStart("abc", 3, "-")` returns `"---abc"`.

#### Strung.leftPad(str, targetLength, padString := " ")

An alias for `Strung.padStart()` see above.

#### Strung.repeat(str, count)

Returns the result of repeating `str` `count` times. For example, `Strung.repeat("abc", 3)` returns `"abcabcabc"`.

#### Strung.replace(str, search, replacement)

Returns the result of replacing the first occurrence of the `search` string within `str` with the `replacement` string.

For example, `Strung.replace("alpha", "a", "x")` returns `"xlpha"`.

#### Strung.replaceAll(str, search, replacement)

Returns the result of replacing the all occurrences of the `search` string within `str` with the `replacement` string.

For example, `Strung.replace("alpha", "a", "x")` returns `"xlphx"`.

#### Strung.search(str, regex)

Returns the index of the first match found by `regex` within `str`.

For example, `Strung.search("abc123", "\d")` returns `4`.

#### Strung.slice(str, start, end := StrLen(str))

Returns a slice of `str` starting at index `start`, and ending at index `end` (which defaults to the length of `str`).

For example, `Strung.slice("abcdef", 2, 4)` returns `"bcd"`.

#### Strung.split(str, separator, limit := 0, mode := "string")

Returns an array of strings which are the result of splitting `str` by the given `separator`, but only up to `limit` number of strings. The `mode` determines whether `separator` is interpreted as a string or a regular expression. Valid values for `mode` are `"string"` (the default) and `"regex"`.

#### Strung.startsWith(str, prefix)

Returns a boolean indicating whether `str` starts with the specified `suffix`. For example, `Strung.startsWith("xyz", "x")` returns `true`.

#### Strung.toUpperCase(str)

Returns the result of upper casing `str`. For example, `Strung.toUpperCase("abc")` returns `"ABC"`.

### Strung.toLowerCase(str)

Returns the result of lower casing `str`. For example, `Strung.toLowerCase("XYZ")` returns `"xyz"`.

#### Strung.trim(str)

Returns the result of removing all spaces and tabs from the beginning and end of `str`. For example, `Strung.trim("   abc   ")` returns `"abc"`.

### Strung.trimEnd(str)

Returns the result of removing all spaces and tabs from the end of `str`. For example, `Strung.trimEnd("   abc   ")` returns `"   abc"`.

### Strung.trimStart(str)

Returns the result of removing all spaces and tabs from the beginning of `str`. For example, `Strung.trim("   abc   ")` returns `"abc   "`.

### Strung.capitalize(str)

Returns the result of uppercasing the first character of `str`. For example, `Strung.capitalize("john")` returns `"John"`.

### Strung.decapitalize(str)

Returns the result of lowercasing the first character of `str`. For example, `Strung.capitalize("Jane")` returns `"jane"`.

#### Strung.chop(str, length)

Returns an array of strings derived by taking every `length` number of characters as a new string. The final string in the array may be less than `length` if `str` is not neatly divisible by `length`.

For example, `Strung.chop("abc", 2)` returns `["ab", "c"]`.

#### Strung.consolidateSpaces(str)

Returns the result of replacing all groups of spaces in `str` with a single space, and trimming leading and trailing spaces. For example, `Strung.consolidateSpaces(" a  b  c ")` returns `"a b c"`.


#### Strung.toArray(str)

Returns an array of the characters in `str`. For example, `Strung.toArray("abc")` returns `["a", "b", "c"]`.

#### Strung.chars(str)

An alias for `Strung.toArray()`. See above.

#### Strung.swapCase(str)

Returns the result of swapping the case of each character in `str`. For example, `Strung.swapCase("aBc")` returns `"AbC"`.

#### Strung.count(str, search)

Returns the number of times `search` occurs in `str`. For example, `Strung.count("abc", "b")` returns `1`.

#### Strung.length(str)

Returns the length of `str`. For example, `Strung.length("abc")` returns `3`.

#### Strung.insert(str, index, insert)

Returns the result of inserting `insert` into `str` at `index`. For example, `Strung.insert("abc", 1, "x")` returns `"axbc"`.

#### Strung.isBlank(str)

Returns a boolean indicating whether `str` is blank. A string is considered blank if it is empty, or contains only spaces and tabs. For example, `Strung.isBlank("   ")` returns `true`.

#### Strung.join(separator, strs*)

Returns the result of joining the given strings with the given `separator`. For example, `Strung.join(", ", "a", "b", "c")` returns `"a, b, c"`.

Can also accept an array rather than a series of arguments. For example, `Strung.join(", ", ["a", "b", "c"])` returns `"a, b, c"`.

#### Strung.linesToArray(str)

Returns an array of the lines in `str`. For example, `Strung.linesToArray("a\nb\nc")` returns `["a", "b", "c"]`. Lines may be delimited by either `"`n"` or `"`r`n"`.

#### Strung.lineCount(str)

Returns the number of lines in `str`. For example, `Strung.lineCount("a\nb\nc")` returns `3`.

#### Strung.reverse(str)

Returns the result of reversing the characters in `str`. For example, `Strung.reverse("abc")` returns `"cba"`.

#### Strung.titleCase(str)

Returns the result of uppercasing the first character of each word in `str`. For example, `Strung.titleCase("the quick brown fox")` returns `"The Quick Brown Fox"`.

#### Strung.truncate(str, length, truncateStr := "")

Returns the result of truncating `str` to `length` characters, and appending `truncateStr` if the string was truncated. For example, `Strung.truncate("abcdef", 3, "...")` returns `"abc..."`.

#### Strung.wordsToArray(str)

Returns an array of the words in `str`. For example, `Strung.wordsToArray("a b c")` returns `["a", "b", "c"]`.

#### Strung.wordCount(str)

Returns the number of words in `str`. For example, `Strung.wordCount("a b c")` returns `3`.

#### Strung.surround(str, surround)

Returns the result of surrounding `str` with `surround`. For example, `Strung.surround("abc", "x")` returns `"xabcx"`.

#### Strung.quote(str, q := '"')

Returns the result of surrounding `str` with `q` (which defaults to `'"'`). For example, `Strung.quote("abc", "'")` returns `"'abc'"`.

#### Strung.unquote(str, q := '"')

Returns the result of removing `q` (which defaults to `'"'`) from the beginning and end of `str`. For example, `Strung.unquote("'abc'", "'")` returns `"abc"`.

If there is not a `q` at **both** the beginning and end of `str`, `str` is returned unchanged. For example, `Strung.unquote("'abc", "'")` returns `"'abc"`.

#### Strung.toBoolean(str)

Converts `str` to a boolean if it is a string commonly used as a boolean indicator. For example: `Strung.toBoolean("on")` returns `true`.

The following strings are considered true:

- `"on"`
- `"yes"`
- `"true"`
- `"1"`

The following strings are considered false:

- `"off"`
- `"no"`
- `"false"`
- `"0"`

Comparisons are case insensitive. For example, `Strung.toBoolean("On")` returns `true`.

#### Strung.map(str, mapper)

Returns the result of applying `mapper` to each character in `str`. For example, `Strung.map("abc", (c) => Strung.toUpperCase(c))` returns `"ABC"`.

[ahkpm]:https://ahkpm.dev/
