Describe "prerequisites" {
    It "MarkDig assembly exists" {
        (Get-ChildItem -Path .\bin\Markdig.dll).FullName | Should -Exist
    }
    It "MarkDig license exists" {
        (Get-ChildItem -Path .\bin\license.txt).FullName | Should -Exist
    }
}

Import-Module '.\ConvertFrom-MarkDown.psd1' -Force

Describe "Converting MarkDown" {
    It "Converts MarkDown to HTML when ParameterSet is MarkDown; from the pipeline" {
        $actual = ("# Converting to MarkDown" | ConvertFrom-MarkDown).Trim()
        $actual | Should -Be "<h1>Converting to MarkDown</h1>"
    }

    It "Converts MarkDown to HTML when ParameterSet is MarkDown; from parameter input" {
        $actual = (ConvertFrom-MarkDown -InputObject "# Converting to MarkDown").Trim()
        $actual | Should -Be "<h1>Converting to MarkDown</h1>"
    }

    It "Converts MarkDown to HTML when ParameterSet is Path" {
        $expected = '<h1>Converting to MarkDown</h1>'
        $actual = (ConvertFrom-MarkDown -Path .\Tests\test.md) -replace('\n','')
        $actual | Should -Be $expected
    }
}

Describe "conversion options" {
    It "-UseAbbreviations parameter" {
        $expected = '<p>Later in a text we are using <abbr title="Hypertext Markup Language">HTML</abbr> and it becomes an abbr tag <abbr title="Hypertext Markup Language">HTML</abbr>.</p><p>Later in a text we are using <abbr title="Hypertext Markup Language">HTML</abbr> and it becomes an abbr tag <abbr title="Hypertext Markup Language">HTML</abbr></p>'
        $actual = (ConvertFrom-MarkDown -Path .\Tests\abbreviation.md -UseAbbreviations) -replace('\n','')
        $actual | Should -Be $expected
    }

    It "-UseAutoIdentifiers parameter" {
        $expected = '<h1 id="this-is-a-heading">This is a heading</h1>'
        $actual = ('# This is a heading' | ConvertFrom-MarkDown -UseAutoIdentifiers) -replace('\n','')
        $actual | Should -Be $expected
    }

    It "Converts strikethrough correctly using the -UseEmphasisExtras parameter" {
        $expected = '<p>The following text <del>is deleted</del></p>'
        $actual = ('The following text ~~is deleted~~' | ConvertFrom-MarkDown -UseEmphasisExtras) -replace('\n','')
        $actual | Should -Be $expected
    }

    It "Converts superscript correctly using the  -UseEmphasisExtras parameter" {
        $expected = '<p>2<sup>10</sup> is 1024</p>'
        $actual = ('2^10^ is 1024' | ConvertFrom-MarkDown -UseEmphasisExtras) -replace('\n','')
        $actual | Should -Be $expected
    }

    It "Converts subscript correctly using the  -UseEmphasisExtras parameter" {
        $expected = '<p>H<sub>2</sub>O is a liquid</p>'
        $actual = ('H~2~O is a liquid' | ConvertFrom-MarkDown -UseEmphasisExtras) -replace('\n','')
        $actual | Should -Be $expected
    }

    It "Converts inserted correctly using the -UseEmphasisExtras parameter" {
        $expected = '<p><ins>Inserted text</ins></p>'
        $actual = ('++Inserted text++' | ConvertFrom-MarkDown -UseEmphasisExtras) -replace('\n','')
        $actual | Should -Be $expected
    }

    It "Converts marked correctly using the -UseEmphasisExtras parameter" {
        $expected = '<p><mark>Marked text</mark></p>'
        $actual = ('==Marked text==' | ConvertFrom-MarkDown -UseEmphasisExtras) -replace('\n','')
        $actual | Should -Be $expected
    }

    It "Converts autolinks correctly using the -UseAutoLinks parameter" {
        $expected = '<p>This is a <a href="http://www.google.com">http://www.google.com</a> URL and <a href="https://www.google.com">https://www.google.com</a>This is a <a href="ftp://test.com">ftp://test.com</a>And a <a href="mailto:email@toto.com">email@toto.com</a>And a plain <a href="http://www.google.com">www.google.com</a></p>'
        $actual = (ConvertFrom-MarkDown -Path .\Tests\autolinks.md -UseAutoLinks) -replace('\n','')
        $actual | Should -Be $expected
    }
}