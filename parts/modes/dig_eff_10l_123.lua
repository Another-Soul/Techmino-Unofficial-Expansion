return {
    env={
        drop=60,lock=60,
        sequence='bag',seqData={26,27,28,29},
        eventSet='dig_10l',
        bg='bg2',bgm='race',
    },
    score=function(P) return {P.stat.time,P.stat.piece} end,
    scoreDisp=function(D) return STRING.time(D[1]).."   "..D[2].." Pieces" end,
    comp=function(a,b) return a[1]<b[1] or (a[1]==b[1] and a[2]<b[2]) end,
    getRank=function(P)
        if P.stat.dig<10 then return end
        local P=P.stat.piece
        return
        P<=9 and 5 or
        P<=11 and 4 or
        P<=14 and 3 or
        P<=17 and 2 or
        P<=20 and 1 or
        0
    end,
}
