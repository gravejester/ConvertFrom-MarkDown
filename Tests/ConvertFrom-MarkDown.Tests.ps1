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
        "# Converting to MarkDown" | Out-File -FilePath .\pestertestfile.md -Force
        $actual = (ConvertFrom-MarkDown -Path .\pestertestfile.md).Trim()
        Remove-Item .\pestertestfile.md -Force
        $actual | Should -Be "<h1>Converting to MarkDown</h1>"
    }
}

Describe "conversion options" {
    It "-UseAbbreviations parameter" {
        $result = '<p>Later in a text we are using <abbr title="Hypertext Markup Language">HTML</abbr> and it becomes an abbr tag <abbr title="Hypertext Markup Language">HTML</abbr>.</p><p>Later in a text we are using <abbr title="Hypertext Markup Language">HTML</abbr> and it becomes an abbr tag <abbr title="Hypertext Markup Language">HTML</abbr></p>'
        $actual = (ConvertFrom-MarkDown -Path .\Tests\abbreviation.md -UseAbbreviations) -replace('\n','')
        $actual | Should -Be $result
    }

    It "-UseAutoIdentifiers parameter" {
        $result = '<h1 id="this-is-a-heading">This is a heading</h1>'
        $actual = ('# This is a heading' | ConvertFrom-MarkDown -UseAutoIdentifiers) -replace('\n','')
        $actual | Should -Be $result
    }
}