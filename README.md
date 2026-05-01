## [google/embeddinggemma-300m](https://huggingface.co/google/embeddinggemma-300m)

**EmbeddingGemma** is an encoder-only text embedding model released by **Google** in 2025.

|`max_position_embeddings`|`hidden_size`|`num_hidden_layers`|`pooling`
|-:|-:|-:|-:|
|`2048`|`768`|`24`|`mean`

```4d
var $AIClient : cs.AIKit.OpenAI
$AIClient:=cs.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8080/v1"  // llama-server

$query:="4D Serverが使用するTCPポート番号を教えて?"

var $batch : cs.AIKit.OpenAIEmbeddingsResult
$batch:=$AIClient.embeddings.create($query)

If ($batch.success)
	$vector:=$batch.embedding.embedding
	var $comparison:={vector: $vector; metric: mk cosine; threshold: 0.7}
	var $results:=ds.Documents.query("Embeddings > :1"; $comparison)
	If ($results.length#0)
		ALERT($results.first().Text)
	End if 
End if 
```
