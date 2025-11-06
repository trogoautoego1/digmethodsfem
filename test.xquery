let $documents := collection("./corpus?select=*.xml")
let $elements := collection("./corpus?select=*.xml")//*
let $countDocuments := count($documents)
let $countElements := count($elements)
return ($countDocuments, $countElements)