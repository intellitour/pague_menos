package br.com.geekfox.apps.pmproductscanner.json;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by rafaelbrasileiro on 26/08/14.
 */
public class Fields {
    private String gtinNm;
    private String gcpCd;
    private String glnNm;
    private String gtinCd;
    private String gpcSNm;
    private Integer pkgUnit;
    private String prefixNm;
    private String glnAddrCity;
    private String glnCountryIsoCd;
    private String glnAddr04;
    private String glnAddr02;
    private String brandBsin;
    private String countryIsoCd;
    private String brandNm;
    private String returnCode;
    private String brandLink;
    private String brandImg;
    private Integer mFloz;
    private String gtinImg;
    private String gpcSCd;
    private String glnCd;
    private String glnAddrPostalcode;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    public String getGtinNm() {
        return gtinNm;
    }

    public void setGtinNm(String gtinNm) {
        this.gtinNm = gtinNm;
    }

    public String getGcpCd() {
        return gcpCd;
    }

    public void setGcpCd(String gcpCd) {
        this.gcpCd = gcpCd;
    }

    public String getGlnNm() {
        return glnNm;
    }

    public void setGlnNm(String glnNm) {
        this.glnNm = glnNm;
    }

    public String getGtinCd() {
        return gtinCd;
    }

    public void setGtinCd(String gtinCd) {
        this.gtinCd = gtinCd;
    }

    public String getGpcSNm() {
        return gpcSNm;
    }

    public void setGpcSNm(String gpcSNm) {
        this.gpcSNm = gpcSNm;
    }

    public Integer getPkgUnit() {
        return pkgUnit;
    }

    public void setPkgUnit(Integer pkgUnit) {
        this.pkgUnit = pkgUnit;
    }

    public String getPrefixNm() {
        return prefixNm;
    }

    public void setPrefixNm(String prefixNm) {
        this.prefixNm = prefixNm;
    }

    public String getGlnAddrCity() {
        return glnAddrCity;
    }

    public void setGlnAddrCity(String glnAddrCity) {
        this.glnAddrCity = glnAddrCity;
    }

    public String getGlnCountryIsoCd() {
        return glnCountryIsoCd;
    }

    public void setGlnCountryIsoCd(String glnCountryIsoCd) {
        this.glnCountryIsoCd = glnCountryIsoCd;
    }

    public String getGlnAddr04() {
        return glnAddr04;
    }

    public void setGlnAddr04(String glnAddr04) {
        this.glnAddr04 = glnAddr04;
    }

    public String getGlnAddr02() {
        return glnAddr02;
    }

    public void setGlnAddr02(String glnAddr02) {
        this.glnAddr02 = glnAddr02;
    }

    public String getBrandBsin() {
        return brandBsin;
    }

    public void setBrandBsin(String brandBsin) {
        this.brandBsin = brandBsin;
    }

    public String getCountryIsoCd() {
        return countryIsoCd;
    }

    public void setCountryIsoCd(String countryIsoCd) {
        this.countryIsoCd = countryIsoCd;
    }

    public String getBrandNm() {
        return brandNm;
    }

    public void setBrandNm(String brandNm) {
        this.brandNm = brandNm;
    }

    public String getReturnCode() {
        return returnCode;
    }

    public void setReturnCode(String returnCode) {
        this.returnCode = returnCode;
    }

    public String getBrandLink() {
        return brandLink;
    }

    public void setBrandLink(String brandLink) {
        this.brandLink = brandLink;
    }

    public String getBrandImg() {
        return brandImg;
    }

    public void setBrandImg(String brandImg) {
        this.brandImg = brandImg;
    }

    public Integer getMFloz() {
        return mFloz;
    }

    public void setMFloz(Integer mFloz) {
        this.mFloz = mFloz;
    }

    public String getGtinImg() {
        return gtinImg;
    }

    public void setGtinImg(String gtinImg) {
        this.gtinImg = gtinImg;
    }

    public String getGpcSCd() {
        return gpcSCd;
    }

    public void setGpcSCd(String gpcSCd) {
        this.gpcSCd = gpcSCd;
    }

    public String getGlnCd() {
        return glnCd;
    }

    public void setGlnCd(String glnCd) {
        this.glnCd = glnCd;
    }

    public String getGlnAddrPostalcode() {
        return glnAddrPostalcode;
    }

    public void setGlnAddrPostalcode(String glnAddrPostalcode) {
        this.glnAddrPostalcode = glnAddrPostalcode;
    }

    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }
}
