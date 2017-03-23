using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WebCam : MonoBehaviour {

	// Use this for initialization
	void Start () {
		var camera = GetComponent<Camera>();
		camera.aspect = 320.0f / 568.0f ;
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
