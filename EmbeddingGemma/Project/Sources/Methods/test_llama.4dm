//%attributes = {}
var $en; $fr : 4D:C1709.Vector
var $AIClient : cs:C1710.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs:C1710.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8080/v1"  // llama-server

$batch:=$AIClient.embeddings.create(["Comment réinitialiser mon mot de passe?"; "To reset your password you must contanct customer support."])

$fr:=$batch.embeddings[0].embedding
$en:=$batch.embeddings[1].embedding

$cosineSimilarity:=$en.cosineSimilarity($fr)
//0.79367952698266

ALERT:C41([$cosineSimilarity].join())