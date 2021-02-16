# Using GPT-2

The prediction endpoint is a POST endpoint that receives a JSON object on the body.

## Parameters

There are different parameters fields you can add in that JSON object that allows for diferent text generation
for the different modes of text generation.

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

## Response

The response of the model is a list of generated sequences.

## Python example

This is a minimal example using Python and the boto library.

```python
import boto3
client = boto3.client('sagemaker-runtime')
endpoint_name = "gpt-2-demo"
content_type = "application/json"
payload = '{"input": "This is an input text"}'

response = client.invoke_endpoint(
    EndpointName=endpoint_name,
    ContentType=content_type,
    Body=payload
    )

print(response["Body"].read())
```

```
[
  "This is an input text file which is created from a file.\n\nThis is the input text file which will be converted to a PDF and used as the source text.\n\nThis is the text file that is used to convert the PDF to",
  "This is an input text field.\n\nYou can customize this field through the following parameters:",
  "This is an input text box which has a lot of options. You will be able to change the size of the text and change the font and line height.\n\nYou can also add or remove the \"back\" button. If you select a"
]
```

## Mode: sample-top-p

This is the default mode to generate text.
It works as a nice default for a variety of inputs.

These parameters can be used on this mode:

| Param | Default value |
|---|---|
| `top_p` | `0.92` |
| `top_p` | `50` |

## Mode: sample-top-k

These parameters can be used on this mode:

| Param | Default value |
|---|---|
| `top_k` | `50` |

## Mode: sample

This mode works as a general version of `sample-top-p` and `sample-top-k`.

These parameters can be used on this mode:

| Param | Default value |
|---|---|
| `top_p` | `0.92` |
| `top_k` | `50` |
| `temperature` | `0.7` |

## Mode: beam

These parameters can be used on this mode:

| Param | Default value |
|---|---|
| `num_beams` | `5` |
| `no_repeat_ngram_size` | `2` |

## Mode: Greedy

There are no arguments on this mode.
