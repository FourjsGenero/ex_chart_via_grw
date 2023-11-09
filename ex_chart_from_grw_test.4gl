IMPORT util

IMPORT FGL ex_chart_from_grw

DEFINE rec simpleChartFormatType
DEFINE arr simpleChartDataType

MAIN

    DEFINE i INTEGER
    DEFINE filename STRING
    DEFINE len INTEGER

    WHENEVER ANY ERROR STOP
    DEFER INTERRUPT
    DEFER QUIT
    OPTIONS FIELD ORDER FORM
    OPTIONS INPUT WRAP

    CALL ui.Interface.loadStyles("ex_chart_from_grw.4st")

    CLOSE WINDOW SCREEN

    LET rec.chart_title = "Example Chart via GRW"
    LET rec.key_title = "Key Title"
    LET rec.value_title = "Value Title"
    LET rec.chart_type = "Pie"
    LET rec.draw_legend = TRUE
    LET rec.draw_labels = TRUE

    OPEN WINDOW w WITH FORM "ex_chart_from_grw" ATTRIBUTES(TEXT = "Simple Chart via GRW")
    DIALOG ATTRIBUTES(UNBUFFERED)
        INPUT BY NAME rec.* ATTRIBUTES(WITHOUT DEFAULTS = TRUE)

        END INPUT
        INPUT ARRAY arr FROM scr.* ATTRIBUTES(WITHOUT DEFAULTS = TRUE)

        END INPUT

        ON ACTION populate ATTRIBUTES(TEXT = "Populate and Draw")
            LET len = util.Math.rand(25) + 2 -- Between 2 and 26 items
            CALL arr.clear()
            FOR i = 1 TO len
                LET arr[i].key = ASCII (64 + i), ASCII (96 + i), ASCII (96 + i)
                LET arr[i].value = util.Math.rand(1000000) / 100
            END FOR
            GOTO lbl_draw

        ON ACTION draw ATTRIBUTES(TEXT = "Draw")
            LABEL lbl_draw:
            IF arr.getLength() > 0 THEN
                LET filename = ex_chart_from_grw.generate(rec, arr)
                DISPLAY filename TO img
            ELSE
                ERROR "No data to draw"
                CLEAR img
            END IF
            #DISPLAY ui.Interface.filenameToURI(filename) TO img

        ON ACTION close
            EXIT DIALOG
    END DIALOG
END MAIN
