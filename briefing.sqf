waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["websiteinfo","Server Info"];

player createDiaryRecord ["websiteinfo",
    [
        "Website Info",
            "
                Below is the info related to our servers.<br/><br/>
                Website - olympus-entertainment.com<br/>
                Teamspeak - olympus.ts.nfoservers.com<br/><br/>
            "
    ]
];