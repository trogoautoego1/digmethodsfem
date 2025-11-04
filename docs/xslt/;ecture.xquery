(: doc("http://dh.obdurodon.org/wilde-testimony.xml") :) 

(: x query introduces syntaxal expresssions
FLOWOR :)

(: for let where order-by return :)

for $speech in //speech
where $speech/speaker eq "Wilde" (: or for $speech in //speech[speaker eq "Wilde"] :)
return /$speech
(: must have single return at end :)
(: expression Must have ""for" or "let" :)
(: above, find all speech elements in given document, 
return all of them in order and return as the speeches when done :)

 (: return for each speech's speaker child and keep on
 (: where $speech/speaker ne "Wilde"  
when speaker element is eq to "Wilde" :)


(((returns speaker elements where wild is not)))
    where $speech/speaker ne "Wilde"
    for $speaker//speaker
    return $speaker

change to...
    for $speaker in distinct-values(//speaker)
    return $speaker

returns literal xpath speaker ("getting into XML mode")
    <speakers> 
         for $speaker in distinct-values(//speaker)
         return $speaker
    </speakers>

<speakers> {
for $speaker in distinct-values(//speaker)
return <speaker>  {$speaker ( <-- this is the string value) } </speaker>
} </speakers>

number of time each speaker element speaks
    let $speeches := //speech   (
    for $speaker in distinct-values(//speaker)
    return <speaker>  {$speaker } </speaker>
    let $speaker_speeches := 
        $speeces[speaker eq $speaker]       (returns individual
    let speaker_speech_count :=
        count($speaker_speeches)  (creates element speaker_speech_count. returns integer, counts speaker_speeches)
    order by $speakerreturns 
    return <speaker>{concat($speaker, " (" speaker_speech_count, ")")} ({           (concatonates all results)
            
            </speaker>
    } </speakers>

