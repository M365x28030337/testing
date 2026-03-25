[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared Table = let
  Source = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("i45WMlRQ0lEKSS0uUYrViVYyAnJcUnPzlWJjAQ==", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [ID = _t, Nombre = _t]),
  #"Changed column type" = Table.TransformColumnTypes(Source, {{"ID", Int64.Type}, {"Nombre", type text}})
in
  #"Changed column type";
