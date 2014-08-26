package br.com.geekfox.apps.pmproductscanner.services;

import android.os.Debug;
import android.util.Log;
import br.com.geekfox.apps.pmproductscanner.json.PODReturn;
import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

/**
 * Created by rafaelbrasileiro on 26/08/14.
 */
public class PODService {
    private static HttpClient httpClient;

    private static final String SERVICE_URL = "http://pod.opendatasoft.com/api/records/1.0/search?dataset=pod_gtin&facet=gpc_s_nm&facet=brand_nm&facet=owner_nm&facet=gln_nm&facet=prefix_nm";
    //
    public static PODReturn retrieveProductByGtin(String gtin) {
        httpClient = new DefaultHttpClient();
        PODReturn podReturn;
        Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();
        HttpGet get = null;

        try {
            get = new HttpGet(SERVICE_URL + "&q=gtin_cd:" + gtin);
            get.setHeader("Accept", "application/json");

            HttpResponse response = httpClient.execute(get);
            int status = response.getStatusLine().getStatusCode();
            String result = EntityUtils.toString(response.getEntity());
            if (status == 200) {
                podReturn = gson.fromJson(result, PODReturn.class);
            }
            else {
                podReturn = null;
            }

        }
        catch(Exception e) {
            e.printStackTrace();
            podReturn = null;
        }

        return podReturn;
    }
}
