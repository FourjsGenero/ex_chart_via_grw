
IMPORT os
IMPORT FGL libgre

PUBLIC TYPE simpleChartFormatType RECORD
    chart_title STRING,
    chart_type STRING,
    key_title STRING,
    value_title STRING,
    draw_legend BOOLEAN,
    draw_labels BOOLEAN
END RECORD

PUBLIC TYPE simpleChartRowType RECORD
    key STRING,
    value FLOAT
END RECORD
PUBLIC TYPE simpleChartDataType DYNAMIC ARRAY OF simpleChartRowType


FUNCTION generate(f simpleChartFormatType, d simpleChartDataType)
    DEFINE grw om.SaxDocumentHandler
    DEFINE i INTEGER
    DEFINE filename STRING

    IF NOT fgl_report_loadCurrentSettings("simple_chart.4rp") THEN
        RETURN NULL
    END IF

    LET filename = os.Path.makeTempName()

    CALL fgl_report_selectDevice("Image")
    CALL fgl_report_selectPreview(FALSE)
    CALL fgl_report_configureImageDevice(NULL, NULL, NULL, 1, 1, "png", os.Path.dirName(filename), os.Path.baseName(filename), NULL)
    LET grw = fgl_report_commitCurrentSettings()

    START REPORT simple_chart TO XML HANDLER grw
    FOR i = 1 TO d.getLength()
        OUTPUT TO REPORT simple_chart(f, d[i].*)
    END FOR
    FINISH REPORT simple_chart
    RETURN (filename || "0001.png")

END FUNCTION

PRIVATE REPORT simple_chart(f simpleChartFormatType, d simpleChartRowType)

    FORMAT
        FIRST PAGE HEADER
            PRINTX f.*

        ON EVERY ROW
            PRINTX d.*
END REPORT