---
external help file: ConvertFrom-MarkDown-help.xml
Module Name: ConvertFrom-MarkDown
online version: https://communary.net/
schema: 2.0.0
---

# ConvertFrom-MarkDown

## SYNOPSIS
Read and convert a MarkDown document to HTML.

## SYNTAX

### MarkDown (Default)
```
ConvertFrom-MarkDown [-InputObject <String>] [-SkipYamlFrontMatter] [-UseAbbreviations] [-UseAutoIdentifiers]
 [-UseAutoLinks] [-UsePipeTables] [-UseGridTables] [-UseBootstrap] [-UseCustomContainers] [-UseDefinitionLists]
 [-UseDiagrams] [-UseEmoji] [-UseEmphasisExtras] [-UseFigures] [-UseFooters] [-UseCitations] [-UseFootnotes]
 [-UseGenericAttributes] [-UseHardlineBreaks] [-UseJiraLinks] [-UseListExtras] [-UseMathematics]
 [-UseMediaLinks] [-UseSmartyPants] [-UseTaskLists] [-UseNoFollowLinks] [-UseNonAsciiNoEscape]
 [-UsePragmaLines] [-UsePreciseSourceLocation] [-DisableHtml] [<CommonParameters>]
```

### Path
```
ConvertFrom-MarkDown [-Path <String>] [-SkipYamlFrontMatter] [-UseAbbreviations] [-UseAutoIdentifiers]
 [-UseAutoLinks] [-UsePipeTables] [-UseGridTables] [-UseBootstrap] [-UseCustomContainers] [-UseDefinitionLists]
 [-UseDiagrams] [-UseEmoji] [-UseEmphasisExtras] [-UseFigures] [-UseFooters] [-UseCitations] [-UseFootnotes]
 [-UseGenericAttributes] [-UseHardlineBreaks] [-UseJiraLinks] [-UseListExtras] [-UseMathematics]
 [-UseMediaLinks] [-UseSmartyPants] [-UseTaskLists] [-UseNoFollowLinks] [-UseNonAsciiNoEscape]
 [-UsePragmaLines] [-UsePreciseSourceLocation] [-DisableHtml] [<CommonParameters>]
```

## DESCRIPTION
Read and convert a MarkDown document to HTML.

## EXAMPLES

### EXAMPLE 1
```
C:\> ConvertFrom-MarkDown -Path ./document.md
```

### EXAMPLE 2
```
C:\> ConvertFrom-MarkDown -InputObject "### MarkDown"
```

### EXAMPLE 3
```
C:\> "### MarkDown" | ConvertFrom-MarkDown
```

## PARAMETERS

### -Path
Path to MarkDown document.

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
MarkDown string to convert.

```yaml
Type: String
Parameter Sets: MarkDown
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -SkipYamlFrontMatter
Discard YAML frontmatter at the beginning of a Markdown document.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseAbbreviations
Activate support for MarkDown abbreviations.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseAutoIdentifiers
Activate support for automatically creating identifiers for headings.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseAutoLinks
Activate support for automatically creating links.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UsePipeTables
Activate support for pipe tables.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseGridTables
Activate support for grid tables.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseBootstrap
Tag some HTML elements with bootstrap classes

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseCustomContainers
Activate support for custom containers.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseDefinitionLists
Activate suport for definition lists.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseDiagrams
Activate support for diagrams. Currently supporting "mermaid" and "nomnoml".

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseEmoji
Emoji and smiley replacement

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseEmphasisExtras
Support for strikethrough, subscript, superscript, inserted and marked

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseFigures
Support for figures and figure captions

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseFooters
Activate support for footers.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseCitations
Activate support for citations.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseFootnotes
Activate support for foot notes.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseGenericAttributes
{{Fill UseGenericAttributes Description}}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseHardlineBreaks
Generate hardline break for softline breaks

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseJiraLinks
Find, and automatically add links to JIRA issue numbers

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseListExtras
Add new type of list items (a., A., i., I.)

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseMathematics
Activate support for mathematics.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseMediaLinks
Extend image Markdown links in case a video or an audio file is linked and output proper link

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseSmartyPants
Enable SmartyPants

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseTaskLists
Activate support for task lists.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseNoFollowLinks
Automatically render rel=nofollow to all links in an HTML output

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseNonAsciiNoEscape
Disable URI escape with % characters for non-US-ASCII characters in order to workaround a bug under IE/Edge
with local file links containing non US-ASCII chars.
DO NOT USE OTHERWISE.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UsePragmaLines
{{Fill UsePragmaLines Description}}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UsePreciseSourceLocation
{{Fill UsePreciseSourceLocation Description}}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisableHtml
Disable parsing of HTML.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String

## NOTES
This function is a PowerShell wrapper for markdig (https://github.com/lunet-io/markdig)
Author:  Øyvind Kallstad
Date: 04.02.2018
Version: 1.0

## RELATED LINKS

[https://communary.net/](https://communary.net/)

[https://github.com/lunet-io/markdig](https://github.com/lunet-io/markdig)

