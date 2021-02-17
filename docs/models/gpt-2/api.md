# GPT-2 API

The inference endpoint is a POST endpoint that receives a JSON object on the body.

The JSON object is a one level object with the different inputs of the model.
For example:

```
{
    "input": "This is an input text",
    "max_length": 50,
    "mode": "sample-top-p",
    "top_p": 0.92,
    "top_k": 50,
    "temperature": 0.7,
    "num_beams": 5,
    "no_repeat_ngram_size": 2,
    "num_return_sequences": 3,
    "seed": 0
}
```

The response of the model is a list of generated sequences.

```
[
  "This is an input text file which is created from a file.\n\nThis is the input text file which will be converted to a PDF and used as the source text.\n\nThis is the text file that is used to convert the PDF to",
  "This is an input text field.\n\nYou can customize this field through the following parameters:",
  "This is an input text box which has a lot of options. You will be able to change the size of the text and change the font and line height.\n\nYou can also add or remove the \"back\" button. If you select a"
]
```

## Parameters

| Param | Value | Default |
|---|---|---|
| `input` | Text to be completed | **required** |
| `max_length` | Number of works to be generated | `100` |
| `num_return_sequences` | Number of sequences to return | `3` |
| `mode` | Options: `sample-top-p`, `sample-top-k`, `sample`, `beam`, `greedy` | `sample-top-p` |
| `top_p` | Top probability | `0.92` |
| `top_k` | Top K | `50` |
| `temperature` | Temperature | `0.7` |
| `num_beams` | Number of beams | `5` |
| `no_repeat_ngram_size` | No repeat n-gram size | `2` |
| `seed` | Set random seed before making a prediction | `None` |

The `input`, `max_length` and `num_return_sequences` parameters can be used in all modes.

## Mode: `sample-top-p`

This is the default mode to generate text.
It works as a nice default for a variety of inputs.

These parameters can be used on this mode:

| Param | Default value |
|---|---|
| `top_p` | `0.92` |
| `top_p` | `50` |

## Mode: `sample-top-k`

These parameters can be used on this mode:

| Param | Default value |
|---|---|
| `top_k` | `50` |

## Mode: `sample`

This mode works as a general version of `sample-top-p` and `sample-top-k`.

These parameters can be used on this mode:

| Param | Default value |
|---|---|
| `top_p` | `0.92` |
| `top_k` | `50` |
| `temperature` | `0.7` |

## Mode: `beam`

These parameters can be used on this mode:

| Param | Default value |
|---|---|
| `num_beams` | `5` |
| `no_repeat_ngram_size` | `2` |

## Mode: `greedy`

There are no arguments on this mode.
