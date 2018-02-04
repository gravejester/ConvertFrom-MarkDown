function ConvertFrom-MarkDown {
    <#
        .SYNOPSIS
            Read and convert a MarkDown document to HTML.
        .DESCRIPTION
            Read and convert a MarkDown document to HTML.
        .EXAMPLE
            ConvertFrom-MarkDown -Path ./document.md
        .INPUTS
            MarkDown
        .OUTPUTS
            HTML
        .LINK
            https://communary.net/
        .LINK
            https://github.com/lunet-io/markdig
        .NOTES
            This function is a PowerShell wrapper for markdig (https://github.com/lunet-io/markdig)
            Author: Øyvind Kallstad
            Date: 04.02.2018
            Version: 1.0
    #>
    [CmdletBinding()]
    param (
        # Path to MarkDown document
        [Parameter()]
        [string] $Path,
        # Discard YAML frontmatter at the beginning of a Markdown document
        [switch] $SkipYamlFrontMatter,
        [switch] $UseAbbreviations,
        [switch] $UseAutoIdentifiers,
        [switch] $UseAutoLinks,
        [switch] $UsePipeTables,
        [switch] $UseGridTables,
        # Tag some HTML elements with bootstrap classes
        [switch] $UseBootstrap,
        [switch] $UseCustomContainers,
        [switch] $UseDefinitionLists,
        [switch] $UseDiagrams,
        # Emoji and smiley replacement
        [switch] $UseEmoji,
        # Support for strikethrough, subscript, superscript, inserted and marked
        [switch] $UseEmphasisExtras,
        # Support for figures and figure captions
        [switch] $UseFigures,
        [switch] $UseFooters,
        [switch] $UseCitations,
        [switch] $UseFootnotes,
        [switch] $UseGenericAttributes,
        # Generate hardline break for softline breaks
        [switch] $UseHardlineBreaks,
        # Find, and automatically add links to JIRA issue numbers
        [switch] $UseJiraLinks,
        # Add new type of list items (a., A., i., I.)
        [switch] $UseListExtras,
        [switch] $UseMathematics,
        # Extend image Markdown links in case a video or an audio file is linked and output proper link
        [switch] $UseMediaLinks,
        # Enable SmartyPants
        [switch] $UseSmartyPants,
        [switch] $UseTaskLists,
        # Automatically render rel=nofollow to all links in an HTML output
        [switch] $UseNoFollowLinks,
        # Disable URI escape with % characters for non-US-ASCII characters in order to workaround a bug under IE/Edge
        # with local file links containing non US-ASCII chars. DO NOT USE OTHERWISE.
        [switch] $UseNonAsciiNoEscape,
        [switch] $UsePragmaLines,
        [switch] $UsePreciseSourceLocation,
        [switch] $DisableHtml
    )

    try {
        $null = [System.Reflection.Assembly]::LoadFile('C:\Users\grave\Scripts\PSStaticSiteBuilder\Markdig.0.14.9\lib\netstandard1.1\Markdig.dll')

        if (-not(Test-Path -Path $Path)) {
            Write-Warning "$Path not found!"
            break
        }

        $markdown = Get-Content -Path $Path -Raw

        # create a pipeline builder object
        # this is needed to handle extensions to markdig
        $pipelineBuilder = [Markdig.MarkdownPipelineBuilder]::new()

        # add markdig extensions as needed
        if ($SkipYamlFrontMatter)       { [void][Markdig.MarkdownExtensions]::UseYamlFrontMatter($pipelineBuilder)       }
        if ($UseAbbreviations)          { [void][Markdig.MarkdownExtensions]::UseAbbreviations($pipelineBuilder)         }
        if ($UseAutoIdentifiers)        { [void][Markdig.MarkdownExtensions]::UseAutoIdentifiers($pipelineBuilder)       }
        if ($UseAutoLinks)              { [void][Markdig.MarkdownExtensions]::UseAutoLinks($pipelineBuilder)             }
        if ($UsePipeTables)             { [void][Markdig.MarkdownExtensions]::UsePipeTables($pipelineBuilder)            }
        if ($UseGridTables)             { [void][Markdig.MarkdownExtensions]::UseGridTables($pipelineBuilder)            }
        if ($UseBootstrap)              { [void][Markdig.MarkdownExtensions]::UseBootstrap($pipelineBuilder)             }
        if ($UseCustomContainers)       { [void][Markdig.MarkdownExtensions]::UseCustomContainers($pipelineBuilder)      }
        if ($UseDefinitionLists)        { [void][Markdig.MarkdownExtensions]::UseDefinitionLists($pipelineBuilder)       }
        if ($UseDiagrams)               { [void][Markdig.MarkdownExtensions]::UseDiagrams($pipelineBuilder)              }
        if ($UseEmoji)                  { [void][Markdig.MarkdownExtensions]::UseEmoji($pipelineBuilder)                 }
        if ($UseEmphasisExtras)         { [void][Markdig.MarkdownExtensions]::UseEmphasisExtras($pipelineBuilder)        }
        if ($UseFigures)                { [void][Markdig.MarkdownExtensions]::UseFigures($pipelineBuilder)               }
        if ($UseFooters)                { [void][Markdig.MarkdownExtensions]::UseFooters($pipelineBuilder)               }
        if ($UseCitations)              { [void][Markdig.MarkdownExtensions]::UseCitations($pipelineBuilder)             }
        if ($UseFootnotes)              { [void][Markdig.MarkdownExtensions]::UseFootnotes($pipelineBuilder)             }
        if ($UseGenericAttributes)      { [void][Markdig.MarkdownExtensions]::UseGenericAttributes($pipelineBuilder)     }
        if ($UseHardlineBreaks)         { [void][Markdig.MarkdownExtensions]::UseHardlineBreaks($pipelineBuilder)        }
        if ($UseJiraLinks)              { [void][Markdig.MarkdownExtensions]::UseJiraLinks($pipelineBuilder)             }
        if ($UseListExtras)             { [void][Markdig.MarkdownExtensions]::UseListExtras($pipelineBuilder)            }
        if ($UseMathematics)            { [void][Markdig.MarkdownExtensions]::UseMathematics($pipelineBuilder)           }
        if ($UseMediaLinks)             { [void][Markdig.MarkdownExtensions]::UseMediaLinks($pipelineBuilder)            }
        if ($UseSmartyPants)            { [void][Markdig.MarkdownExtensions]::UseSmartyPants($pipelineBuilder)           }
        if ($UseTaskLists)              { [void][Markdig.MarkdownExtensions]::UseTaskLists($pipelineBuilder)             }
        if ($UseNoFollowLinks)          { [void][Markdig.MarkdownExtensions]::UseNoFollowLinks($pipelineBuilder)         }
        if ($UseNonAsciiNoEscape)       { [void][Markdig.MarkdownExtensions]::UseNonAsciiNoEscape($pipelineBuilder)      }
        if ($UsePragmaLines)            { [void][Markdig.MarkdownExtensions]::UsePragmaLines($pipelineBuilder)           }
        if ($UsePreciseSourceLocation)  { [void][Markdig.MarkdownExtensions]::UsePreciseSourceLocation($pipelineBuilder) }
        if ($DisableHtml)               { [void][Markdig.MarkdownExtensions]::DisableHtml($pipelineBuilder)              }

        # build the pipeline object
        $pipeline = $pipelineBuilder.Build()

        # convert to html
        $outHtml = [Markdig.Markdown]::ToHtml($markdown,$pipeline)

        Write-Output $outHtml
    }
    catch {
        Write-Warning $_.Exception.Message
    }
}