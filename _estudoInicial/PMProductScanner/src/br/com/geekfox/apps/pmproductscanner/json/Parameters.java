package br.com.geekfox.apps.pmproductscanner.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rafaelbrasileiro on 26/08/14.
 */
public class Parameters {
    private Integer rows;
    private String format;
    private List<String> facet = new ArrayList<String>();
    private List<String> dataset = new ArrayList<String>();
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public List<String> getFacet() {
        return facet;
    }

    public void setFacet(List<String> facet) {
        this.facet = facet;
    }

    public List<String> getDataset() {
        return dataset;
    }

    public void setDataset(List<String> dataset) {
        this.dataset = dataset;
    }

    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }
}
