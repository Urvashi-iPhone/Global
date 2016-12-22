# Global

<h3>Google Place</h3>
```c
NSMutableArray *searchPlaceList=[[NSMutableArray alloc]init];
//searchTextString is search Term eg. mum returns mumbai and other result array
searchPlaceList = [httpws getGooglePlace:searchTextString];
```
