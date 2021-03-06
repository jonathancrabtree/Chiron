#!/usr/bin/env cwl-runner
cwlVersion: v1.0
label: Humann2 - Run Humann2 tool
class: CommandLineTool

hints:
  - class: DockerRequirement
    dockerPull: umigs/chiron-humann2

inputs:
  input_file:
    label: Accepts FASTA, FASTQ, SAM, or m8 formats
    inputBinding:
      prefix: --input
    type: File
  output_dir:
    inputBinding:
      prefix: --output
    type: string
  gap_fill:
    label: Can be set to "on"
    inputBinding:
      prefix: --gap-fill
    type: string?
  bypass_translated_search:
    inputBinding:
      prefix: --bypass-translated-search
    type: boolean?
  num_threads:
    inputBinding:
      prefix: --threads
    type: int
    default: 1
outputs:
  out_dir:
    type: Directory
    outputBinding:
      glob: $(inputs.output_dir)

baseCommand: ["humann2"]
