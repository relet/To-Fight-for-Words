xof 0303txt 0032


template VertexDuplicationIndices { 
 <b8d65549-d7c9-4995-89cf-53a9a8b031e3>
 DWORD nIndices;
 DWORD nOriginalVertices;
 array DWORD indices[nIndices];
}
template XSkinMeshHeader {
 <3cf169ce-ff7c-44ab-93c0-f78f62d172e2>
 WORD nMaxSkinWeightsPerVertex;
 WORD nMaxSkinWeightsPerFace;
 WORD nBones;
}
template SkinWeights {
 <6f0d123b-bad2-4167-a0d0-80224f25fabb>
 STRING transformNodeName;
 DWORD nWeights;
 array DWORD vertexIndices[nWeights];
 array float weights[nWeights];
 Matrix4x4 matrixOffset;
}

Frame RootFrame {

  FrameTransformMatrix {
    1.000000,0.000000,0.000000,0.000000,
    0.000000,1.000000,0.000000,0.000000,
    0.000000,0.000000,-1.000000,0.000000,
    0.000000,0.000000,0.000000,1.000000;;
  }
  Frame Cube_004 {

    FrameTransformMatrix {
      0.000000,-0.095500,0.000000,0.000000,
      0.605300,0.000000,0.000000,0.000000,
      0.000000,0.000000,0.116900,0.000000,
      0.012400,-0.586200,0.273600,1.000000;;
    }
Mesh {
24;
1.000000; 1.000000; -1.000000;,
1.000000; -1.000000; -1.000000;,
-1.000000; -1.000000; -1.000000;,
-1.000000; 1.000000; -1.000000;,
0.400500; 0.793800; 1.000000;,
-0.400500; 0.793800; 1.000000;,
-0.400500; -0.793800; 1.000000;,
0.400500; -0.793800; 1.000000;,
1.000000; 1.000000; -1.000000;,
0.400500; 0.793800; 1.000000;,
0.400500; -0.793800; 1.000000;,
1.000000; -1.000000; -1.000000;,
1.000000; -1.000000; -1.000000;,
0.400500; -0.793800; 1.000000;,
-0.400500; -0.793800; 1.000000;,
-1.000000; -1.000000; -1.000000;,
-1.000000; -1.000000; -1.000000;,
-0.400500; -0.793800; 1.000000;,
-0.400500; 0.793800; 1.000000;,
-1.000000; 1.000000; -1.000000;,
0.400500; 0.793800; 1.000000;,
1.000000; 1.000000; -1.000000;,
-1.000000; 1.000000; -1.000000;,
-0.400500; 0.793800; 1.000000;;
6;
4; 0, 3, 2, 1;,
4; 4, 7, 6, 5;,
4; 8, 11, 10, 9;,
4; 12, 15, 14, 13;,
4; 16, 19, 18, 17;,
4; 20, 23, 22, 21;;
  MeshMaterialList {
    2;
    6;
    1,
    1,
    1,
    1,
    1,
    1;;
  Material Material {
    0.800000; 0.800000; 0.800000;1.0;;
    0.500000;
    1.000000; 1.000000; 1.000000;;
    0.0; 0.0; 0.0;;
  }  //End of Material
  Material Mat1 {
    1.0; 1.0; 1.0; 1.0;;
    1.0;
    1.0; 1.0; 1.0;;
    0.0; 0.0; 0.0;;
  TextureFilename {    "castle.jpg";  }
  }  // End of Material
    }  //End of MeshMaterialList
  MeshNormals {
24;
    0.634449; 0.658834; -0.404187;,
    0.634449; -0.658834; -0.404187;,
    -0.634449; -0.658834; -0.404187;,
    -0.634449; 0.658834; -0.404187;,
    0.488907; 0.507706; 0.709311;,
    -0.488907; 0.507706; 0.709311;,
    -0.488907; -0.507706; 0.709311;,
    0.488907; -0.507706; 0.709311;,
    0.634449; 0.658834; -0.404187;,
    0.488907; 0.507706; 0.709311;,
    0.488907; -0.507706; 0.709311;,
    0.634449; -0.658834; -0.404187;,
    0.634449; -0.658834; -0.404187;,
    0.488907; -0.507706; 0.709311;,
    -0.488907; -0.507706; 0.709311;,
    -0.634449; -0.658834; -0.404187;,
    -0.634449; -0.658834; -0.404187;,
    -0.488907; -0.507706; 0.709311;,
    -0.488907; 0.507706; 0.709311;,
    -0.634449; 0.658834; -0.404187;,
    0.488907; 0.507706; 0.709311;,
    0.634449; 0.658834; -0.404187;,
    -0.634449; 0.658834; -0.404187;,
    -0.488907; 0.507706; 0.709311;;
6;
4; 0, 3, 2, 1;,
4; 4, 7, 6, 5;,
4; 8, 11, 10, 9;,
4; 12, 15, 14, 13;,
4; 16, 19, 18, 17;,
4; 20, 23, 22, 21;;
}  //End of MeshNormals
MeshTextureCoords {
24;
0.723271;-0.705294;,
0.723271;-0.287171;,
0.891394;-0.287171;,
0.891394;-0.705294;,
0.777121;-0.343861;,
0.848366;-0.345315;,
0.848998;-0.651838;,
0.776835;-0.651354;,
0.726227;-0.290268;,
0.777121;-0.343861;,
0.776835;-0.651354;,
0.724647;-0.703033;,
0.724647;-0.703033;,
0.776835;-0.651354;,
0.848998;-0.651838;,
0.890018;-0.703033;,
0.890018;-0.703033;,
0.848998;-0.651838;,
0.848366;-0.345315;,
0.891097;-0.290446;,
0.777121;-0.343861;,
0.726227;-0.290268;,
0.891097;-0.290446;,
0.848366;-0.345315;;
}  //End of MeshTextureCoords
  }  // End of the Mesh Cube.004 
  }  // SI End of the Object Cube.004 
  Frame Cube_003 {

    FrameTransformMatrix {
      0.000000,-0.095500,0.000000,0.000000,
      0.605300,0.000000,0.000000,0.000000,
      0.000000,0.000000,0.116900,0.000000,
      0.012400,0.513800,0.273600,1.000000;;
    }
Mesh {
24;
1.000000; 1.000000; -1.000000;,
1.000000; -1.000000; -1.000000;,
-1.000000; -1.000000; -1.000000;,
-1.000000; 1.000000; -1.000000;,
0.400500; 0.793800; 1.000000;,
-0.400500; 0.793800; 1.000000;,
-0.400500; -0.793800; 1.000000;,
0.400500; -0.793800; 1.000000;,
1.000000; 1.000000; -1.000000;,
0.400500; 0.793800; 1.000000;,
0.400500; -0.793800; 1.000000;,
1.000000; -1.000000; -1.000000;,
1.000000; -1.000000; -1.000000;,
0.400500; -0.793800; 1.000000;,
-0.400500; -0.793800; 1.000000;,
-1.000000; -1.000000; -1.000000;,
-1.000000; -1.000000; -1.000000;,
-0.400500; -0.793800; 1.000000;,
-0.400500; 0.793800; 1.000000;,
-1.000000; 1.000000; -1.000000;,
0.400500; 0.793800; 1.000000;,
1.000000; 1.000000; -1.000000;,
-1.000000; 1.000000; -1.000000;,
-0.400500; 0.793800; 1.000000;;
6;
4; 0, 3, 2, 1;,
4; 4, 7, 6, 5;,
4; 8, 11, 10, 9;,
4; 12, 15, 14, 13;,
4; 16, 19, 18, 17;,
4; 20, 23, 22, 21;;
  MeshMaterialList {
    2;
    6;
    1,
    1,
    1,
    1,
    1,
    1;;
  Material Material {
    0.800000; 0.800000; 0.800000;1.0;;
    0.500000;
    1.000000; 1.000000; 1.000000;;
    0.0; 0.0; 0.0;;
  }  //End of Material
  Material Mat1 {
    1.0; 1.0; 1.0; 1.0;;
    1.0;
    1.0; 1.0; 1.0;;
    0.0; 0.0; 0.0;;
  TextureFilename {    "castle.jpg";  }
  }  // End of Material
    }  //End of MeshMaterialList
  MeshNormals {
24;
    0.634449; 0.658834; -0.404187;,
    0.634449; -0.658834; -0.404187;,
    -0.634449; -0.658834; -0.404187;,
    -0.634449; 0.658834; -0.404187;,
    0.488907; 0.507706; 0.709311;,
    -0.488907; 0.507706; 0.709311;,
    -0.488907; -0.507706; 0.709311;,
    0.488907; -0.507706; 0.709311;,
    0.634449; 0.658834; -0.404187;,
    0.488907; 0.507706; 0.709311;,
    0.488907; -0.507706; 0.709311;,
    0.634449; -0.658834; -0.404187;,
    0.634449; -0.658834; -0.404187;,
    0.488907; -0.507706; 0.709311;,
    -0.488907; -0.507706; 0.709311;,
    -0.634449; -0.658834; -0.404187;,
    -0.634449; -0.658834; -0.404187;,
    -0.488907; -0.507706; 0.709311;,
    -0.488907; 0.507706; 0.709311;,
    -0.634449; 0.658834; -0.404187;,
    0.488907; 0.507706; 0.709311;,
    0.634449; 0.658834; -0.404187;,
    -0.634449; 0.658834; -0.404187;,
    -0.488907; 0.507706; 0.709311;;
6;
4; 0, 3, 2, 1;,
4; 4, 7, 6, 5;,
4; 8, 11, 10, 9;,
4; 12, 15, 14, 13;,
4; 16, 19, 18, 17;,
4; 20, 23, 22, 21;;
}  //End of MeshNormals
MeshTextureCoords {
24;
0.723271;-0.705294;,
0.723271;-0.287171;,
0.891394;-0.287171;,
0.891394;-0.705294;,
0.777121;-0.343861;,
0.848366;-0.345315;,
0.848998;-0.651838;,
0.776835;-0.651354;,
0.726227;-0.290268;,
0.777121;-0.343861;,
0.776835;-0.651354;,
0.724647;-0.703033;,
0.724647;-0.703033;,
0.776835;-0.651354;,
0.848998;-0.651838;,
0.890018;-0.703033;,
0.890018;-0.703033;,
0.848998;-0.651838;,
0.848366;-0.345315;,
0.891097;-0.290446;,
0.777121;-0.343861;,
0.726227;-0.290268;,
0.891097;-0.290446;,
0.848366;-0.345315;;
}  //End of MeshTextureCoords
  }  // End of the Mesh Cube.003 
  }  // SI End of the Object Cube.003 
  Frame Cube_002 {

    FrameTransformMatrix {
      0.095500,0.000000,0.000000,0.000000,
      0.000000,0.605300,0.000000,0.000000,
      0.000000,0.000000,0.116900,0.000000,
      0.512400,0.000000,0.273600,1.000000;;
    }
Mesh {
24;
1.000000; 1.000000; -1.000000;,
1.000000; -1.000000; -1.000000;,
-1.000000; -1.000000; -1.000000;,
-1.000000; 1.000000; -1.000000;,
0.400500; 0.793800; 1.000000;,
-0.400500; 0.793800; 1.000000;,
-0.400500; -0.793800; 1.000000;,
0.400500; -0.793800; 1.000000;,
1.000000; 1.000000; -1.000000;,
0.400500; 0.793800; 1.000000;,
0.400500; -0.793800; 1.000000;,
1.000000; -1.000000; -1.000000;,
1.000000; -1.000000; -1.000000;,
0.400500; -0.793800; 1.000000;,
-0.400500; -0.793800; 1.000000;,
-1.000000; -1.000000; -1.000000;,
-1.000000; -1.000000; -1.000000;,
-0.400500; -0.793800; 1.000000;,
-0.400500; 0.793800; 1.000000;,
-1.000000; 1.000000; -1.000000;,
0.400500; 0.793800; 1.000000;,
1.000000; 1.000000; -1.000000;,
-1.000000; 1.000000; -1.000000;,
-0.400500; 0.793800; 1.000000;;
6;
4; 0, 3, 2, 1;,
4; 4, 7, 6, 5;,
4; 8, 11, 10, 9;,
4; 12, 15, 14, 13;,
4; 16, 19, 18, 17;,
4; 20, 23, 22, 21;;
  MeshMaterialList {
    2;
    6;
    1,
    1,
    1,
    1,
    1,
    1;;
  Material Material {
    0.800000; 0.800000; 0.800000;1.0;;
    0.500000;
    1.000000; 1.000000; 1.000000;;
    0.0; 0.0; 0.0;;
  }  //End of Material
  Material Mat1 {
    1.0; 1.0; 1.0; 1.0;;
    1.0;
    1.0; 1.0; 1.0;;
    0.0; 0.0; 0.0;;
  TextureFilename {    "castle.jpg";  }
  }  // End of Material
    }  //End of MeshMaterialList
  MeshNormals {
24;
    0.634449; 0.658834; -0.404187;,
    0.634449; -0.658834; -0.404187;,
    -0.634449; -0.658834; -0.404187;,
    -0.634449; 0.658834; -0.404187;,
    0.488907; 0.507706; 0.709311;,
    -0.488907; 0.507706; 0.709311;,
    -0.488907; -0.507706; 0.709311;,
    0.488907; -0.507706; 0.709311;,
    0.634449; 0.658834; -0.404187;,
    0.488907; 0.507706; 0.709311;,
    0.488907; -0.507706; 0.709311;,
    0.634449; -0.658834; -0.404187;,
    0.634449; -0.658834; -0.404187;,
    0.488907; -0.507706; 0.709311;,
    -0.488907; -0.507706; 0.709311;,
    -0.634449; -0.658834; -0.404187;,
    -0.634449; -0.658834; -0.404187;,
    -0.488907; -0.507706; 0.709311;,
    -0.488907; 0.507706; 0.709311;,
    -0.634449; 0.658834; -0.404187;,
    0.488907; 0.507706; 0.709311;,
    0.634449; 0.658834; -0.404187;,
    -0.634449; 0.658834; -0.404187;,
    -0.488907; 0.507706; 0.709311;;
6;
4; 0, 3, 2, 1;,
4; 4, 7, 6, 5;,
4; 8, 11, 10, 9;,
4; 12, 15, 14, 13;,
4; 16, 19, 18, 17;,
4; 20, 23, 22, 21;;
}  //End of MeshNormals
MeshTextureCoords {
24;
0.723271;-0.705294;,
0.723271;-0.287171;,
0.891394;-0.287171;,
0.891394;-0.705294;,
0.777121;-0.343861;,
0.848366;-0.345315;,
0.848998;-0.651838;,
0.776835;-0.651354;,
0.726227;-0.290268;,
0.777121;-0.343861;,
0.776835;-0.651354;,
0.724647;-0.703033;,
0.724647;-0.703033;,
0.776835;-0.651354;,
0.848998;-0.651838;,
0.890018;-0.703033;,
0.890018;-0.703033;,
0.848998;-0.651838;,
0.848366;-0.345315;,
0.891097;-0.290446;,
0.777121;-0.343861;,
0.726227;-0.290268;,
0.891097;-0.290446;,
0.848366;-0.345315;;
}  //End of MeshTextureCoords
  }  // End of the Mesh Cube.002 
  }  // SI End of the Object Cube.002 
  Frame Cube_001 {

    FrameTransformMatrix {
      0.095500,0.000000,0.000000,0.000000,
      0.000000,0.605300,0.000000,0.000000,
      0.000000,0.000000,0.116900,0.000000,
      -0.487600,0.000000,0.273600,1.000000;;
    }
Mesh {
24;
1.000000; 1.000000; -1.000000;,
1.000000; -1.000000; -1.000000;,
-1.000000; -1.000000; -1.000000;,
-1.000000; 1.000000; -1.000000;,
0.400500; 0.793800; 1.000000;,
-0.400500; 0.793800; 1.000000;,
-0.400500; -0.793800; 1.000000;,
0.400500; -0.793800; 1.000000;,
1.000000; 1.000000; -1.000000;,
0.400500; 0.793800; 1.000000;,
0.400500; -0.793800; 1.000000;,
1.000000; -1.000000; -1.000000;,
1.000000; -1.000000; -1.000000;,
0.400500; -0.793800; 1.000000;,
-0.400500; -0.793800; 1.000000;,
-1.000000; -1.000000; -1.000000;,
-1.000000; -1.000000; -1.000000;,
-0.400500; -0.793800; 1.000000;,
-0.400500; 0.793800; 1.000000;,
-1.000000; 1.000000; -1.000000;,
0.400500; 0.793800; 1.000000;,
1.000000; 1.000000; -1.000000;,
-1.000000; 1.000000; -1.000000;,
-0.400500; 0.793800; 1.000000;;
6;
4; 0, 3, 2, 1;,
4; 4, 7, 6, 5;,
4; 8, 11, 10, 9;,
4; 12, 15, 14, 13;,
4; 16, 19, 18, 17;,
4; 20, 23, 22, 21;;
  MeshMaterialList {
    2;
    6;
    1,
    1,
    1,
    1,
    1,
    1;;
  Material Material {
    0.800000; 0.800000; 0.800000;1.0;;
    0.500000;
    1.000000; 1.000000; 1.000000;;
    0.0; 0.0; 0.0;;
  }  //End of Material
  Material Mat1 {
    1.0; 1.0; 1.0; 1.0;;
    1.0;
    1.0; 1.0; 1.0;;
    0.0; 0.0; 0.0;;
  TextureFilename {    "castle.jpg";  }
  }  // End of Material
    }  //End of MeshMaterialList
  MeshNormals {
24;
    0.634449; 0.658834; -0.404187;,
    0.634449; -0.658834; -0.404187;,
    -0.634449; -0.658834; -0.404187;,
    -0.634449; 0.658834; -0.404187;,
    0.488907; 0.507706; 0.709311;,
    -0.488907; 0.507706; 0.709311;,
    -0.488907; -0.507706; 0.709311;,
    0.488907; -0.507706; 0.709311;,
    0.634449; 0.658834; -0.404187;,
    0.488907; 0.507706; 0.709311;,
    0.488907; -0.507706; 0.709311;,
    0.634449; -0.658834; -0.404187;,
    0.634449; -0.658834; -0.404187;,
    0.488907; -0.507706; 0.709311;,
    -0.488907; -0.507706; 0.709311;,
    -0.634449; -0.658834; -0.404187;,
    -0.634449; -0.658834; -0.404187;,
    -0.488907; -0.507706; 0.709311;,
    -0.488907; 0.507706; 0.709311;,
    -0.634449; 0.658834; -0.404187;,
    0.488907; 0.507706; 0.709311;,
    0.634449; 0.658834; -0.404187;,
    -0.634449; 0.658834; -0.404187;,
    -0.488907; 0.507706; 0.709311;;
6;
4; 0, 3, 2, 1;,
4; 4, 7, 6, 5;,
4; 8, 11, 10, 9;,
4; 12, 15, 14, 13;,
4; 16, 19, 18, 17;,
4; 20, 23, 22, 21;;
}  //End of MeshNormals
MeshTextureCoords {
24;
0.723271;-0.705294;,
0.723271;-0.287171;,
0.891394;-0.287171;,
0.891394;-0.705294;,
0.777121;-0.343861;,
0.848366;-0.345315;,
0.848998;-0.651838;,
0.776835;-0.651354;,
0.726227;-0.290268;,
0.777121;-0.343861;,
0.776835;-0.651354;,
0.724647;-0.703033;,
0.724647;-0.703033;,
0.776835;-0.651354;,
0.848998;-0.651838;,
0.890018;-0.703033;,
0.890018;-0.703033;,
0.848998;-0.651838;,
0.848366;-0.345315;,
0.891097;-0.290446;,
0.777121;-0.343861;,
0.726227;-0.290268;,
0.891097;-0.290446;,
0.848366;-0.345315;;
}  //End of MeshTextureCoords
  }  // End of the Mesh Cube.001 
  }  // SI End of the Object Cube.001 
}  // End of the Root Frame