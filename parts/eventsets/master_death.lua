local rush_lock={30,26,22,18,15, 15,15,15,15,15}
local rush_wait={18,14,14,8, 7,  6, 6, 6, 6, 6}
local rush_fall={12,6, 6, 6, 5,  4, 4, 4, 4, 4}

return {
    drop=0,
    lock=rush_lock[1],
    wait=rush_wait[1],
    fall=rush_fall[1],
    noTele=true,
    das=12,arr=1,
    mesDisp=function(P)
        PLY.draw.drawProgress(P.modeData.pt,P.modeData.target)
    end,
    hook_drop=function(P)
        local D=P.modeData

        local c=#P.clearedRow
        if c==0 and D.pt%100==99 then return end
        local s=c<5 and c+1
        D.pt=D.pt+s

        if D.pt%100==99 then
            SFX.play('warn_1')
        elseif D.pt>=D.target then
            s=D.target/100
            local E=P.gameEnv
            E.lock=rush_lock[s]
            E.wait=rush_wait[s]
            E.fall=rush_fall[s]

            if s==1 then
                BG.set('cubes')
                E.das=12
            elseif s==2 then
                BG.set('rainbow')
                E.das=12
            elseif s==3 then
                BG.set('rainbow')
                E.das=10
            elseif s==4 then
                BG.set('glow')
                E.das=8
            elseif s==5 then
                if P.stat.frame>236*60 then --3:56
                    D.pt=500
                    P:win('finish')
                    return
                else
                    E.das=8
                    BG.set('glow')
                    BGM.play('secret8th remix')
                end
            elseif s==6 then
                BG.set('flink')
            elseif s==7 then
                BG.set('flink')
            elseif s==8 then
                BG.set('flink')
            elseif s==9 then
                BG.set('flink')
            elseif s==10 then
                D.pt=1000
                P:win('finish')
                return
            end
            D.target=D.target+100
            P:stageComplete(s)
            SFX.play('reach')
        end
    end,
    task=function(P)
        P.modeData.pt=0
        P.modeData.target=100
    end,
}