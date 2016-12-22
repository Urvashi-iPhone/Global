# Global

<h3>Google Place</h3>
```c
NSMutableArray *searchPlaceList=[[NSMutableArray alloc]init];
//searchTextString is search Term eg. mum returns mumbai and other result array
searchPlaceList = [httpws getGooglePlace:searchTextString];
```

<h3>Http Request</h3>
<b>Get Request</b>
```c
NSMutableDictionary *dic = [httpws httpGet:<url>];
```

<b>Post Request</b>
```c
setdic = [[NSMutableDictionary alloc]init];
[setdic setObject:username forKey:@"email"];
[setdic setObject:password forKey:@"password"];
        
 NSMutableDictionary *device = [[NSMutableDictionary alloc]init];
[device setObject:@"abcd" forKey:@"udid"];
[device setObject:@"abc" forKey:@"token"];
[device setObject:@"phone" forKey:@"type"];
[device setObject:@"ios" forKey:@"os"];
        
[setdic setObject:device forKey:@"device"];

NSMutableDictionary *dic12 = [httpws httpPost:<url> :setdic];
```

<b>Post Request with Auth</b>
```c
NSString *access_token = <auth_token>;
    
setdic=[[NSMutableDictionary alloc]init];
[setdic setObject:from_address forKey:@"from_address"];
[setdic setObject:to_address forKey:@"to_address"];
[setdic setObject:capacity forKey:@"capacity"];
[setdic setObject:price forKey:@"price"];
[setdic setObject:start_time forKey:@"start_time"];
[setdic setValue:cargo_type forKey:@"cargo_type_id"];
[setdic setObject:part_load_available forKey:@"part_load_available"];
[setdic setObject:vehicle_typelist forKey:@"vehicle_type_id"];
[setdic setObject:is_gps_enable forKey:@"is_gps_enable"];

    
NSString *tripurl=[NSString stringWithFormat:@"%@?page=%d",[baseurl stringByAppendingString:hireSearchurl],pageno];
NSMutableDictionary *dic=[httpws httpPostWithauth:tripurl:setdic:access_token];
```

<b>Put Request with Auth</b>
```c
setdic=[[NSMutableDictionary alloc]init];
        [setdic setValue:[_EditPartsdata valueForKey:@"id"] forKey:@"id"];
        [setdic setObject:c_name forKey:@"company_name"];
        [setdic setObject:fname forKey:@"firstname"];
        [setdic setObject:lname forKey:@"lastname"];
        [setdic setObject:email forKey:@"email"];
        [setdic setObject:mobile forKey:@"mobile"];
        [setdic setObject:name forKey:@"name"];
        [setdic setObject:manufacture forKey:@"manufacturer"];
        [setdic setObject:brand forKey:@"brand"];
        [setdic setObject:city forKey:@"city"];
        [setdic setObject:parts_type forKey:@"parts_type"];
        [setdic setObject:vehi_model forKey:@"vehicle_model"];
        [setdic setObject:manufacture_year forKey:@"year_of_manufacture"];
        [setdic setObject:model_number forKey:@"model_no"];
        [setdic setObject:price forKey:@"price"];
        [setdic setObject:parts_details forKey:@"parts_detail"];
        [setdic setObject:length forKey:@"lenght"];
        [setdic setObject:width forKey:@"width"];
        [setdic setObject:height forKey:@"height"];
        [setdic setObject:weight forKey:@"weight"];
        [setdic setObject:is_new forKey:@"is_new"];
        [setdic setObject:status forKey:@"status"];
    
    NSMutableArray *imaglist = [[NSMutableArray alloc]init];
    for (int i = 0; i<[_imagelist count]; i++)
    {
        [imaglist addObject:[self imageToNSString:[_imagelist objectAtIndex:i]]];
    }
    [setdic setObject:imaglist forKey:@"image"];

    
        NSDictionary *dic12 = [httpws httpPutWithauth:[baseurl stringByAppendingString:EditPartsurl] :setdic :[AppMethod getStringDefault:@"default_access_token"]];
  ```
 <b>Delete Request with Auth</b>
```c
NSMutableDictionary *deleteparts = [[NSMutableDictionary alloc]init];
    
    UIButton *senderButton = (UIButton *)sender;
    
    [deleteparts setObject:[[pager objectAtIndex:senderButton.tag] valueForKey:@"id"]forKey:@"id"];
    
    NSMutableDictionary *dicpass1 = [httpws httpDeletewithauth :[baseurl stringByAppendingString:DeletePartsurl] :deleteparts :[AppMethod getStringDefault:@"default_access_token"]];
```
  
