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
  
  <h3>Login App Method</h3>
  ```c
- (IBAction)loginbtn:(id)sender
{
    username = _uname.text;
    password = _pass.text;
    
    if ([_uname validate] && [_pass validate])
    {
        setdic = [[NSMutableDictionary alloc]init];
        [setdic setObject:username forKey:@"email"];
        [setdic setObject:password forKey:@"password"];
        
        NSMutableDictionary *device = [[NSMutableDictionary alloc]init];
        [device setObject:@"abcd" forKey:@"udid"];
        [device setObject:@"abc" forKey:@"token"];
        [device setObject:@"phone" forKey:@"type"];
        [device setObject:@"ios" forKey:@"os"];
        
        [setdic setObject:device forKey:@"device"];
        
        
         NSMutableDictionary *dic12 = [httpws httpPost:[baseurl stringByAppendingString:loginurl] :setdic];

   
        BOOL boolean = [[dic12 valueForKey:@"status"]boolValue];
        if (boolean)
        {
            SWRevealViewController *tab = [self.storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
           
            
            NSError *error;
            NSData *jsondata = [NSJSONSerialization dataWithJSONObject:dic12 options:NSJSONWritingPrettyPrinted error:&error];
            if (! jsondata)
            {
                NSLog(@"Error:%@" , error);
            }
            else
            {
                NSMutableDictionary *data = [dic12 valueForKey:@"data"];
                
                [AppMethod  setStringDefault:@"default_id" :[data valueForKey:@"id"]];

                [AppMethod  setStringDefault:@"default_access_token" :[data valueForKey:@"access_token"]];
                [AppMethod  setStringDefault:@"default_email" :[data valueForKey:@"email"]];
                
                [AppMethod  setStringDefault:@"default_fname" :[data valueForKey:@"firstname"]];
                [AppMethod  setStringDefault:@"default_lname" :[data valueForKey:@"lastname"]];
                [AppMethod  setStringDefault:@"default_profileImage" :[data valueForKey:@"avatar"]];
                
                
                [AppMethod  setStringDefault:@"default_Companyname" :[[data valueForKey:@"profile"] valueForKey:@"company_name"]];
                
                [AppMethod  setStringDefault:@"default_Mobile" :[[data valueForKey:@"profile"]valueForKey:@"mobile"]];
                [AppMethod  setStringDefault:@"default_Landline" :[[data valueForKey:@"profile"]valueForKey:@"landline"]];
                
                [AppMethod  setStringDefault:@"default_Permit" :[[data valueForKey:@"profile"]valueForKey:@"permit"]];
                
                [AppMethod  setStringDefault:@"default_noofVehicle" :[[data valueForKey:@"profile"]valueForKey:@"no_of_vehicle"]];
                [AppMethod  setStringDefault:@"default_website" :[[data valueForKey:@"profile"]valueForKey:@"website"]];
                [AppMethod  setStringDefault:@"default_locale" :[[data valueForKey:@"profile"]valueForKey:@"locale"]];
              
                [AppMethod  setStringDefault:@"default_Gender" :[[data valueForKey:@"profile"]valueForKey:@"gender"] ];
                
            
                
                [AppMethod  setStringDefault:@"default_RunmileApprove" :[[data valueForKey:@"profile"]valueForKey:@"approve"]];
                [AppMethod  setStringDefault:@"default_ContactPref" :[[data valueForKey:@"profile"]valueForKey:@"contact_preference"]];
                [AppMethod  setStringDefault:@"default_Address" :[[data valueForKey:@"profile"]valueForKey:@"address"]];
                
                [AppMethod  setStringDefault:@"default_AddressLine1" :[[data valueForKey:@"profile"]valueForKey:@"addressline1"]];
                
                [AppMethod  setStringDefault:@"default_AddressLine2" :[[data valueForKey:@"profile"]valueForKey:@"addressline2"]];
                [AppMethod  setStringDefault:@"default_pincode" :[[data valueForKey:@"profile"]valueForKey:@"pincode"]];
                [AppMethod  setStringDefault:@"default_City" :[[data valueForKey:@"profile"]valueForKey:@"city"]];
                
                [AppMethod  setStringDefault:@"default_State" :[[data valueForKey:@"profile"]valueForKey:@"state"]];
                
                
                 [AppMethod  setStringDefault:@"default_Country" :[[data valueForKey:@"profile"]valueForKey:@"country"]];
                
                [AppMethod setStringDefault:@"default_TotalRate" :[[[data valueForKey:@"profile"] valueForKey:@"review"]objectForKey:@"totalRate"]];
                [AppMethod  setStringDefault:@"default_TotalReview" :[[[data valueForKey:@"profile"] valueForKey:@"review"]valueForKey:@"totalReview"]];
                [AppMethod  setStringDefault:@"default_OverAll" :[[[data valueForKey:@"profile"] valueForKey:@"review"] valueForKey:@"overAll"]];
                
                
                 [AppMethod  setStringDefault:@"default_role" :[data valueForKey:@"role"]];
            
            }
      
            [self.navigationController pushViewController:tab animated:YES];
        }
        else
        {
            UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"Alert" message:[dic12 valueForKey:@"message"] delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"Ok", nil];
            [al show];
        }
     }
    
}
```
<h3>Get Method Side Bar</h3>
```c
roletype=[[NSMutableArray alloc]init];
    
//two string concate
    NSString *username = [NSString stringWithFormat:@"%@ %@",[AppMethod getStringDefault:@"default_fname"],[AppMethod getStringDefault:@"default_lname"]];

    _Name.text = username;
    _Email.text = [AppMethod getStringDefault:@"default_email"];
    
    
    
    NSString *imgurl = [AppMethod getStringDefault:@"default_profileImage"];
    _img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgurl]]];
    

    
    NSString *strdata=[NSString stringWithFormat:@"%@",[AppMethod getArrayDefault:@"default_role"]];
    

//    _sellVehicle.hidden = YES;
//    _AutoParts.hidden = YES;
//    _offertransport.hidden = YES;
    
    
    for (int i = 0; i<[[AppMethod getArrayDefault:@"default_role"] count]; i++)
    {
        NSString *abc = [[AppMethod getArrayDefault:@"default_role"] objectAtIndex:i];
        
        if ([abc isEqualToString:@"user"])
        {
            _sellVehicle.enabled = NO;
            _AutoParts.enabled = NO;
            _offertransport.enabled = NO;
        }
        else if ([abc isEqualToString:@"dealer"])
        {
            _sellVehicle.enabled = YES;
            _offertransport.enabled = NO;
            _AutoParts.enabled = NO;

        }
        else if ([abc isEqualToString:@"seller"])
        {
           _offertransport.enabled = NO;
            _sellVehicle.enabled = YES;
             _AutoParts.enabled = YES;
        }
        else if ([abc isEqualToString:@"parts_dealer"])
        {
             _AutoParts.enabled = YES;
            _sellVehicle.enabled = NO;
            _offertransport.enabled = NO;
        }
        else if ([abc isEqualToString:@"transporter"])
        {
            _sellVehicle.enabled = NO;
            _AutoParts.enabled = NO;
            _offertransport.enabled = YES;
        }
        
    }
}



```
