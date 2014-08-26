package br.com.geekfox.apps.pmproductscanner.json;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by rafaelbrasileiro on 26/08/14.
 */
public class Record {
    private String datasetid;
    private String recordid;
    private Fields fields;
    private String recordTimestamp;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    public String getDatasetid() {
        return datasetid;
    }

    public void setDatasetid(String datasetid) {
        this.datasetid = datasetid;
    }

    public String getRecordid() {
        return recordid;
    }

    public void setRecordid(String recordid) {
        this.recordid = recordid;
    }

    public Fields getFields() {
        return fields;
    }

    public void setFields(Fields fields) {
        this.fields = fields;
    }

    public String getRecordTimestamp() {
        return recordTimestamp;
    }

    public void setRecordTimestamp(String recordTimestamp) {
        this.recordTimestamp = recordTimestamp;
    }

    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }
}
