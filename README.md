## Table of Contents
- [Overview](#overview)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [ECOG Scoring Reference](#ecog-scoring-reference)
- [License](#license)

## Overview

This repository provides MATLAB code utilizing regular expressions (regex) to extract the Eastern Cooperative Oncology Group (ECOG) performance status from clinical medical notes. ECOG scores assess patient functioning levels in oncology and are crucial for treatment decisions.

The algorithm is detailed in the publication:

> Maghsoudi, A., Sada, Y. H., Nowakowski, S., Guffey, D., Zhu, H., Yarlagadda, S. R., ... & Razjouyan, J. (2024). A Multi-Institutional Natural Language Processing Pipeline to Extract Performance Status From Electronic Health Records. *Cancer Control*, 31, 10732748241279518.

## Requirements

- MATLAB (tested on versions R2020b and later)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/ecog-nlp-extractor.git
   cd ecog-nlp-extractor
   ```

## Usage

1. Use the MATLAB function `MAIN_ecog(TEXT)` to parse clinical notes:

```matlab
TEXT = 'Patient exhibits good overall condition with ECOG 1 performance status.';
ECOG_Index = MAIN_ecog(TEXT);

% Output
ECOG_Index = 1
```

## ECOG Scoring Reference

| Score | Description                                        |
|-------|----------------------------------------------------|
| 0     | Fully active, no restrictions                      |
| 1     | Restricted in physically strenuous activity        |
| 2     | Ambulatory, capable of self-care, no work          |
| 3     | Limited self-care, confined >50% of waking hours   |
| 4     | Completely disabled, no self-care possible         |

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

