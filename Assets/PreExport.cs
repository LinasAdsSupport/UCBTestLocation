using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;


public class PreExport : MonoBehaviour
{
    public void Start()
    {
        PreExportMethod();
    }
    public async void PreExportMethod()
    {
        Debug.Log("Start Asynch method: "+DateTime.Now.ToString());
        await AwatiForPause();
        Debug.Log("End Asynch method: "+DateTime.Now.ToString());
    }
    async Task<bool> AwatiForPause()
    {
        Debug.Log("Doing the async method");
        await Task.Delay(5000);
        return true;
    }
}
