using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WebCameraShake : MonoBehaviour {

private Transform webCameraTransform;

private Vector3 position;
private Quaternion rotation;
	// Use this for initialization

	void Start () {
		webCameraTransform = GetComponent<Transform> ();
		position = webCameraTransform.localPosition;
		rotation = webCameraTransform.localRotation;
	}


	void FixedUpdate() {
		var time =Time.fixedTime;
		Vector3 pos = position;
		pos.y += Mathf.Sin (time*2.53976f) * 0.165478f;
		pos.x += Mathf.Sin (time*2.3564564f) * 0.12456f;

		pos.z += Mathf.Sin (time*0.369564f) * 0.1187f;


		var angles = rotation.eulerAngles;
		angles.y +=  Mathf.Sin (time*0.169564f) * 3.3187f;
		angles.z +=  Mathf.Sin (time*0.569564f) * 3.887f;
		angles.x +=  Mathf.Sin (time*1.569564f) * 3.887f;

		webCameraTransform.localPosition = pos;

		webCameraTransform.localRotation = Quaternion.Euler(angles);
	}
	// Update is called once per frame
	void Update () {
		
	}
}
