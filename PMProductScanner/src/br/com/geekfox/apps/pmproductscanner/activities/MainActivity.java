package br.com.geekfox.apps.pmproductscanner.activities;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import br.com.geekfox.apps.pmproductscanner.R;
import br.com.geekfox.apps.pmproductscanner.json.PODReturn;
import br.com.geekfox.apps.pmproductscanner.json.Record;
import br.com.geekfox.apps.pmproductscanner.services.PODService;

/**
 * Created by rafaelbrasileiro on 25/08/14.
 */
public class MainActivity extends Activity {
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout_main);

    }

    public void onScanClick(View v) {
        Intent intent = new Intent("com.google.zxing.client.android.SCAN");
        intent.putExtra("SCAN_MODE", "PRODUCT_MODE");
        startActivityForResult(intent, 0);
    }

    public void onOKClick(View v) {
        executeQuery();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 0) {
            EditText txtId = (EditText) findViewById(R.id.editCode);
            if (resultCode == RESULT_OK) {

                txtId.setText(data.getStringExtra("SCAN_RESULT"));
                executeQuery();

            } else if (resultCode == RESULT_CANCELED) {
                Toast.makeText(this, "Scan canceled", Toast.LENGTH_LONG).show();
            }
        }
    }

    public void executeQuery() {
        EditText txtId = (EditText) findViewById(R.id.editCode);
        final String gtin = txtId.getText().toString();
        new AsyncTask<Void, Void, Void>() {
            ProgressDialog dialog;
            PODReturn podReturn;
            @Override
            protected Void doInBackground(Void... voids) {
                podReturn = PODService.retrieveProductByGtin(gtin);
                return null;
            }

            @Override
            protected void onPreExecute() {
                super.onPreExecute();
                dialog = new ProgressDialog(MainActivity.this);
                dialog.setMessage("Buscando na base remota de produtos...");
                dialog.setCancelable(false);
                dialog.show();
            }

            @Override
            protected void onPostExecute(Void aVoid) {
                super.onPostExecute(aVoid);
                dialog.dismiss();
                if (podReturn.getRecords().isEmpty()) {
                    Toast.makeText(MainActivity.this, "Produto não encontrado!", Toast.LENGTH_LONG).show();
                }
                else {
                    //pega primeiro produto
                    Record record = podReturn.getRecords().get(0);
                    populaProduto(record);
                }
            }
        }.execute();
    }

    public void populaProduto(Record record) {
        TextView txtName = (TextView) findViewById(R.id.txtName);
        TextView txtBrand = (TextView) findViewById(R.id.txtBrand);
        TextView txtCity = (TextView) findViewById(R.id.txtCity);
        TextView txtCountry = (TextView) findViewById(R.id.txtCountry);
        txtName.setText(record.getFields().getGtinNm());
        txtBrand.setText(record.getFields().getBrandNm());
        txtCity.setText(record.getFields().getGlnAddrCity());
        txtCountry.setText(record.getFields().getCountryIsoCd());
    }
}