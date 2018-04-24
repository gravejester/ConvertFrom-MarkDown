function ConvertFrom-MarkDown {
    [CmdletBinding(DefaultParameterSetName = 'MarkDown')]
    [OutputType([String])]
    param (
        [Parameter(ParameterSetName = 'Path')]
        [string] $Path,
        [Parameter(ParameterSetName = 'MarkDown', ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $InputObject,
        [switch] $SkipYamlFrontMatter,
        [switch] $UseAbbreviations,
        [switch] $UseAutoIdentifiers,
        [switch] $UseAutoLinks,
        [switch] $UsePipeTables,
        [switch] $UseGridTables,
        [switch] $UseBootstrap,
        [switch] $UseCustomContainers,
        [switch] $UseDefinitionLists,
        [switch] $UseDiagrams,
        [switch] $UseEmoji,
        [switch] $UseEmphasisExtras,
        [switch] $UseFigures,
        [switch] $UseFooters,
        [switch] $UseCitations,
        [switch] $UseFootnotes,
        [switch] $UseGenericAttributes,
        [switch] $UseHardlineBreaks,
        [switch] $UseJiraLinks,
        [switch] $UseListExtras,
        [switch] $UseMathematics,
        [switch] $UseMediaLinks,
        [switch] $UseSmartyPants,
        [switch] $UseTaskLists,
        [switch] $UseNoFollowLinks,
        [switch] $UseNonAsciiNoEscape,
        [switch] $UsePragmaLines,
        [switch] $UsePreciseSourceLocation,
        [switch] $DisableHtml
    )

    try {

        if ($PSCmdlet.ParameterSetName -eq 'Path') {
            if (-not(Test-Path -Path $Path)) {
                Write-Warning "$Path not found!"
                break
            }

            $markdown = Get-Content -Path $Path -Raw
        }
        else {
            $markdown = $InputObject
        }

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