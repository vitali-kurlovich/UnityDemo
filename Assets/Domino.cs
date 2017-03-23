using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Domino : MonoBehaviour
{


	public enum DominoType
	{
		Domino_0 = 0,
		Domino_1 = 1,
		Domino_2 = 2,
		Domino_3 = 3,
		Domino_4 = 4,
		Domino_5 = 5,
		Domino_6 = 6
	}

	public DominoType dominoType;
	// Use this for initialization
	void Start ()
	{
		var go = Resources.Load<Mesh>("domino_low_66");

		Debug.Log (go);

		//var resMeshFilter = go.GetComponent<MeshFilter> ();

		//var meshFilter = GetComponent<MeshFilter> ();
		//meshFilter.mesh = Instantiate (resMeshFilter.sharedMesh) as Mesh;

	}
	
	// Update is called once per frame
	void Update ()
	{
		
	}
}
