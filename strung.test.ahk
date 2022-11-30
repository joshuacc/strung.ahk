#Warn All, StdOut
#Include %A_ScriptDir%\ahkpm-modules\github.com\joshuacc\AutoHotUnit\AutoHotUnit.ahk
#Include strung.ahk

ahu.RegisterSuite(StrungSuite)
ahu.RunSuites()

class StrungSuite extends AutoHotUnitSuite {
    testAt() {
        this.assert.equal(Strung.at("abc", 2), "b")
        this.assert.equal(Strung("abc").at(2).value(), "b")

        this.assert.equal(Strung.at("abc", 4), "")

    }

    testConcat() {
        ; Basics
        this.assert.equal(Strung.concat("abc", "whatever"), "abcwhatever")
        this.assert.equal(Strung("abc").concat("whatever").value(), "abcwhatever")

        ; Multiple arguments
        this.assert.equal(Strung.concat("abc", "def", "ghi"), "abcdefghi")
        this.assert.equal(Strung("abc").concat("def", "ghi").value(), "abcdefghi")


        arr := ["d", "e", "f"]

        ; Array
        this.assert.equal(Strung.concat("abc", arr), "abcdef")
        this.assert.equal(Strung("abc").concat(arr).value(), "abcdef")

        ; Variadic call with array
        this.assert.equal(Strung.concat("abc", arr*), "abcdef")
        this.assert.equal(Strung("abc").concat(arr*).value(), "abcdef")
    }

    testEndsWith() {
        this.assert.equal(Strung.endsWith("abc", "c"), true)
        this.assert.equal(Strung.endsWith("abc", "x"), false)
        this.assert.equal(Strung("abc").endsWith("c"), true)
        this.assert.equal(Strung("abc").endsWith("x"), false)
    }

    testContains() {
        this.assert.equal(Strung.contains("abc", "b"), true)
        this.assert.equal(Strung.contains("abc", "x"), false)
        this.assert.equal(Strung("abc").contains("b"), true)
        this.assert.equal(Strung("abc").contains("x"), false)
    }

    testIncludes() {
        this.assert.equal(Strung.includes("abc", "b"), true)
        this.assert.equal(Strung.includes("abc", "x"), false)
        this.assert.equal(Strung("abc").includes("b"), true)
        this.assert.equal(Strung("abc").includes("x"), false)
    }

    testIndexOf() {
        this.assert.equal(Strung.indexOf("abc", "b"), 2)
        this.assert.equal(Strung("abc").indexOf("b"), 2)

        this.assert.equal(Strung.indexOf("abc", "x"), 0)
        this.assert.equal(Strung("abc").indexOf("x"), 0)

        this.assert.equal(Strung.indexOf("abc", "b", 3), 0)
        this.assert.equal(Strung("abc").indexOf("b, 3"), 0)
    }

    testLastIndexOf() {
        this.assert.equal(Strung.lastIndexOf("abcabc", "b"), 5)
        this.assert.equal(Strung("abcabc").lastIndexOf("b"), 5)

        this.assert.equal(Strung.lastIndexOf("abc", "x"), 0)
        this.assert.equal(Strung("abc").lastIndexOf("x"), 0)
    }

    testPadEnd() {
        this.assert.equal(Strung.padEnd("abc", 5), "abc  ")
        this.assert.equal(Strung("abc").padEnd(5).value(), "abc  ")

        this.assert.equal(Strung.padEnd("abc", 5, "x"), "abcxx")
        this.assert.equal(Strung("abc").padEnd(5, "x").value(), "abcxx")
    }

    testRightPad() {
        this.assert.equal(Strung.rightPad("abc", 5), "abc  ")
        this.assert.equal(Strung("abc").rightPad(5).value(), "abc  ")

        this.assert.equal(Strung.rightPad("abc", 5, "x"), "abcxx")
        this.assert.equal(Strung("abc").rightPad(5, "x").value(), "abcxx")
    }

    testPadStart() {
        this.assert.equal(Strung.padStart("abc", 5), "  abc")
        this.assert.equal(Strung("abc").padStart(5).value(), "  abc")

        this.assert.equal(Strung.padStart("abc", 5, "x"), "xxabc")
        this.assert.equal(Strung("abc").padStart(5, "x").value(), "xxabc")
    }

    testLeftPad() {
        this.assert.equal(Strung.leftPad("abc", 5), "  abc")
        this.assert.equal(Strung("abc").leftPad(5).value(), "  abc")

        this.assert.equal(Strung.leftPad("abc", 5, "x"), "xxabc")
        this.assert.equal(Strung("abc").leftPad(5, "x").value(), "xxabc")
    }

    testReplace() {
        this.assert.equal(Strung.replace("abc", "b", "x"), "axc")
        this.assert.equal(Strung("abc").replace("b", "x").value(), "axc")

        this.assert.equal(Strung.replace("abc", "d", "x"), "abc")
        this.assert.equal(Strung("abc").replace("d", "x").value(), "abc")

        this.assert.equal(Strung.replace("abcabc", "b", "x"), "axcabc")
        this.assert.equal(Strung("abcabc").replace("b", "x").value(), "axcabc")
    }

    testReplaceAll() {
        this.assert.equal(Strung.replaceAll("abc", "b", "x"), "axc")
        this.assert.equal(Strung("abc").replaceAll("b", "x").value(), "axc")

        this.assert.equal(Strung.replaceAll("abc", "d", "x"), "abc")
        this.assert.equal(Strung("abc").replaceAll("d", "x").value(), "abc")

        this.assert.equal(Strung.replaceAll("abcabc", "b", "x"), "axcaxc")
        this.assert.equal(Strung("abcabc").replaceAll("b", "x").value(), "axcaxc")
    }

    testSearch() {
        this.assert.equal(Strung.search("abc", "b"), 2)
        this.assert.equal(Strung("abc").search("b"), 2)

        this.assert.equal(Strung.search("abc", "x"), 0)
        this.assert.equal(Strung("abc").search("x"), 0)
    }

    testSlice() {
        this.assert.equal(Strung.slice("abc", 2), "bc")
        this.assert.equal(Strung("abc").slice(2).value(), "bc")

        this.assert.equal(Strung.slice("abc", 2, 2), "b")
        this.assert.equal(Strung("abc").slice(2, 2).value(), "b")

        this.assert.equal(Strung.slice("abc", 2, 3), "bc")
        this.assert.equal(Strung("abc").slice(2, 3).value(), "bc")
    }

    testSplit() {
        this.assert.equal(Strung.split("abc", "b"), ["a", "c"])
        this.assert.equal(Strung("abc").split("b"), ["a", "c"])

        this.assert.equal(Strung.split("abc", "x"), ["abc"])
        this.assert.equal(Strung("abc").split("x"), ["abc"])

        this.assert.equal(Strung.split("abcabc", "b"), ["a", "ca", "c"])
        this.assert.equal(Strung("abcabc").split("b"), ["a", "ca", "c"])
    }

    testStartsWith() {
        this.assert.equal(Strung.startsWith("abc", "a"), true)
        this.assert.equal(Strung("abc").startsWith("a"), true)

        this.assert.equal(Strung.startsWith("abc", "x"), false)
        this.assert.equal(Strung("abc").startsWith("x"), false)
    }

    testToUpperCase() {
        this.assert.equal(Strung.toUpperCase("abc"), "ABC")
        this.assert.equal(Strung("abc").toUpperCase().value(), "ABC")
    }

    testToLowerCase() {
        this.assert.equal(Strung.toLowerCase("ABC"), "abc")
        this.assert.equal(Strung("ABC").toLowerCase().value(), "abc")
    }

    testTrim() {
        this.assert.equal(Strung.trim(" abc "), "abc")
        this.assert.equal(Strung(" abc ").trim().value(), "abc")
    }

    testTrimEnd() {
        this.assert.equal(Strung.trimEnd(" abc    "), " abc")
        this.assert.equal(Strung(" abc    ").trimEnd().value(), " abc")
    }

    testTrimStart() {
        this.assert.equal(Strung.trimStart("   abc "), "abc ")
        this.assert.equal(Strung("   abc ").trimStart().value(), "abc ")
    }

    testCapitalize() {
        this.assert.equal(Strung.capitalize("abc def"), "Abc def")
        this.assert.equal(Strung("abc def").capitalize().value(), "Abc def")
    }

    testDecapitalize() {
        this.assert.equal(Strung.decapitalize("Abc Def"), "abc Def")
        this.assert.equal(Strung("Abc Def").decapitalize().value(), "abc Def")
    }

    testChop() {
        this.assert.equal(Strung.chop("abcdef", 3), ["abc", "def"])
        this.assert.equal(Strung("abcdef").chop(3), ["abc", "def"])

        this.assert.equal(Strung.chop("abcdef", 2), ["ab", "cd", "ef"])
        this.assert.equal(Strung("abcdef").chop(2), ["ab", "cd", "ef"])

        this.assert.equal(Strung.chop("abc", 2), ["ab", "c"])
        this.assert.equal(Strung("abc").chop(2), ["ab", "c"])
    }

    testConsolidateSpaces() {
        this.assert.equal(Strung.consolidateSpaces(" a  b  c "), "a b c")
        this.assert.equal(Strung(" a  b  c ").consolidateSpaces().value(), "a b c")
    }

    testToArray() {
        this.assert.equal(Strung.toArray("abc"), ["a", "b", "c"])
        this.assert.equal(Strung("abc").toArray(), ["a", "b", "c"])
    }

    testSwapCase() {
        this.assert.equal(Strung.swapCase("aBc"), "AbC")
        this.assert.equal(Strung("aBc").swapCase().value(), "AbC")
    }

    testCount() {
        this.assert.equal(Strung.count("abc", "b"), 1)
        this.assert.equal(Strung("abc").count("b"), 1)

        this.assert.equal(Strung.count("abc", "x"), 0)
        this.assert.equal(Strung("abc").count("x"), 0)
    }

    testLength() {
        this.assert.equal(Strung.length("abc"), 3)
        this.assert.equal(Strung("abc").length(), 3)
    }

    testInsert() {
        this.assert.equal(Strung.insert("abc", 2, "x"), "axbc")
        this.assert.equal(Strung("abc").insert(2, "x").value(), "axbc")
    }

    testIsBlank() {
        this.assert.equal(Strung.isBlank("abc"), false)
        this.assert.equal(Strung("abc").isBlank(), false)

        this.assert.equal(Strung.isBlank(" "), true)
        this.assert.equal(Strung(" ").isBlank(), true)

        this.assert.equal(Strung.isBlank(""), true)
        this.assert.equal(Strung("").isBlank(), true)
    }

    testJoin() {
        this.assert.equal(Strung.join(", ", "a", "b", "c"), "a, b, c")

        arr := ["d", "e", "f"]

        ; Array
        this.assert.equal(Strung.join(", ", arr), "d, e, f")

        ; Variadic call with array
        this.assert.equal(Strung.join(", ", arr*), "d, e, f")
    }

    testLinesToArray() {
        this.assert.equal(Strung.linesToArray("a`nb`nc"), ["a", "b", "c"])
        this.assert.equal(Strung("a`nb`nc").linesToArray(), ["a", "b", "c"])

        this.assert.equal(Strung.linesToArray("a`r`nb`r`nc"), ["a", "b", "c"])
        this.assert.equal(Strung("a`r`nb`r`nc").linesToArray(), ["a", "b", "c"])
    }

    testLineCount() {
        this.assert.equal(Strung.lineCount("a`nb`nc"), 3)
        this.assert.equal(Strung("a`nb`nc").lineCount(), 3)

        this.assert.equal(Strung.lineCount("a`r`nb`r`nc"), 3)
        this.assert.equal(Strung("a`r`nb`r`nc").lineCount(), 3)
    }

    testReverse() {
        this.assert.equal(Strung.reverse("abc"), "cba")
        this.assert.equal(Strung("abc").reverse().value(), "cba")
    }

    testTitleCase() {
        this.assert.equal(Strung.titleCase("abc def"), "Abc Def")
        this.assert.equal(Strung("abc def").titleCase().value(), "Abc Def")
    }

    testTruncate() {
        this.assert.equal(Strung.truncate("abcdef", 3), "abc")
        this.assert.equal(Strung("abcdef").truncate(3).value(), "abc")

        this.assert.equal(Strung.truncate("abcdef", 4, "x"), "abcx")
        this.assert.equal(Strung("abcdef").truncate(4, "x").value(), "abcx")
    }

    testWordsToArray() {
        this.assert.equal(Strung.wordsToArray("abc def"), ["abc", "def"])
        this.assert.equal(Strung("abc def").wordsToArray(), ["abc", "def"])

        this.assert.equal(Strung.wordsToArray("abc `t def"), ["abc", "def"])
        this.assert.equal(Strung("abc `t def").wordsToArray(), ["abc", "def"])
    }

    testWordCount() {
        this.assert.equal(Strung.wordCount("abc def"), 2)
        this.assert.equal(Strung("abc def").wordCount(), 2)

        this.assert.equal(Strung.wordCount("abc `t def`nghi"), 3)
        this.assert.equal(Strung("abc `t def`nghi").wordCount(), 3)
    }

    testSurround() {
        this.assert.equal(Strung.surround("abc", "x"), "xabcx")
        this.assert.equal(Strung("abc").surround("x").value(), "xabcx")
    }

    testQuote() {
        this.assert.equal(Strung.quote("abc"), '"abc"')
        this.assert.equal(Strung("abc").quote().value(), '"abc"')

        this.assert.equal(Strung.quote("abc", "'"), "'abc'")
        this.assert.equal(Strung("abc").quote("'").value(), "'abc'")
    }

    testUnquote() {
        this.assert.equal(Strung.unquote('"abc"'), "abc")
        this.assert.equal(Strung('"abc"').unquote().value(), "abc")

        this.assert.equal(Strung.unquote("'abc'", "'"), "abc")
        this.assert.equal(Strung("'abc'").unquote("'").value(), "abc")
    }

    testToBoolean() {
        this.assert.equal(Strung.toBoolean("true"), true)
        this.assert.equal(Strung("true").toBoolean(), true)

        this.assert.equal(Strung.toBoolean("false"), false)
        this.assert.equal(Strung("false").toBoolean(), false)

        this.assert.equal(Strung.toBoolean("1"), true)
        this.assert.equal(Strung("1").toBoolean(), true)

        this.assert.equal(Strung.toBoolean("0"), false)
        this.assert.equal(Strung("0").toBoolean(), false)

        this.assert.equal(Strung.toBoolean("yes"), true)
        this.assert.equal(Strung("yes").toBoolean(), true)

        this.assert.equal(Strung.toBoolean("no"), false)
        this.assert.equal(Strung("no").toBoolean(), false)

        this.assert.equal(Strung.toBoolean("on"), true)
        this.assert.equal(Strung("on").toBoolean(), true)

        this.assert.equal(Strung.toBoolean("off"), false)
        this.assert.equal(Strung("off").toBoolean(), false)

        ; Case insensitive
        this.assert.equal(Strung.toBoolean("TrUe"), true)
        this.assert.equal(Strung("TrUe").toBoolean(), true)

        this.assert.equal(Strung.toBoolean("FaLsE"), false)
        this.assert.equal(Strung("FaLsE").toBoolean(), false)

        this.assert.equal(Strung.toBoolean("YeS"), true)
        this.assert.equal(Strung("YeS").toBoolean(), true)

        this.assert.equal(Strung.toBoolean("No"), false)
        this.assert.equal(Strung("No").toBoolean(), false)

        this.assert.equal(Strung.toBoolean("On"), true)
        this.assert.equal(Strung("On").toBoolean(), true)

        this.assert.equal(Strung.toBoolean("OfF"), false)
        this.assert.equal(Strung("OfF").toBoolean(), false)

        ; Invalid values
        this.assert.equal(Strung.toBoolean("abc"), "")
        this.assert.equal(Strung("abc").toBoolean(), "")

        this.assert.equal(Strung.toBoolean("123"), "")
        this.assert.equal(Strung("123").toBoolean(), "")
    }

    testMap() {
        this.assert.equal(
            Strung.map("abc", (c) => Strung.toUpperCase(c)),
            "ABC"
        )
        this.assert.equal(
            Strung("abc").map((c) => Strung.toUpperCase(c)).value(),
            "ABC"
        )
    }
}