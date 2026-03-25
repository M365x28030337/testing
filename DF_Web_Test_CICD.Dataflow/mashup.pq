[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared Query = let
  Source = Json.Document(Web.Contents("https://jsonplaceholder.typicode.com/users")),
  #"Converted to table" = Table.FromList(Source, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
  #"Expanded Column1" = Table.ExpandRecordColumn(#"Converted to table", "Column1", {"id", "name", "username", "email", "address", "phone", "website", "company"}, {"id", "name", "username", "email", "address", "phone", "website", "company"}),
  #"Expanded address" = Table.ExpandRecordColumn(#"Expanded Column1", "address", {"street", "suite", "city", "zipcode", "geo"}, {"address.street", "address.suite", "address.city", "address.zipcode", "address.geo"}),
  #"Expanded address.geo" = Table.ExpandRecordColumn(#"Expanded address", "address.geo", {"lat", "lng"}, {"address.geo.lat", "address.geo.lng"}),
  #"Expanded company" = Table.ExpandRecordColumn(#"Expanded address.geo", "company", {"name", "catchPhrase", "bs"}, {"company.name", "company.catchPhrase", "company.bs"}),
  #"Changed column type" = Table.TransformColumnTypes(#"Expanded company", {{"id", Int64.Type}, {"name", type text}, {"username", type text}, {"email", type text}, {"address.street", type text}, {"address.suite", type text}, {"address.city", type text}, {"address.zipcode", type text}, {"address.geo.lat", type number}, {"address.geo.lng", type number}, {"phone", type text}, {"website", type text}, {"company.name", type text}, {"company.catchPhrase", type text}, {"company.bs", type text}})
in
  #"Changed column type";
