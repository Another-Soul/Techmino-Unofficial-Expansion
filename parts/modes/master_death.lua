return {
    env={
        sequence="bagES",
        freshLimit=15,
        eventSet='master_death',
        bg='cubes',bgm='secret8th',
    },
    slowMark=true,
    score=function(P) return {P.modeData.pt,P.stat.time} end,
    scoreDisp=function(D) return D[1].."P   "..STRING.time(D[2]) end,
    comp=function(a,b)
        return a[1]>b[1] or (a[1]==b[1] and a[2]<b[2])
    end,
    getRank=function(P)
        local S=P.modeData.pt
        if S>=1000 then
            local T=P.stat.time
            return
            T<=366 and 5 or
            4
        else
        return
            S>=500 and 3 or
            S>=300 and 2 or
            S>=200 and 1 or
            S>=120 and 0
        end
    end,
}
