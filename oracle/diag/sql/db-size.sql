/*
 *  Copyright 2016 Amazon.com, Inc. or its affiliates.
 *  All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License").
 *  You may not use this file except in compliance with the License.
 *  A copy of the License is located at
 *
 *      http://aws.amazon.com/apache2.0/
 *
 * or in the "license" file accompanying this file.
 * This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language governing permissions
 * and limitations under the License.
*/



COL "db_size (mb)" FORM 9999999
COL owner format a20
COL "segment_size (mb)" FORM 9999999
SET PAGES 80
SET LINESIZE 120

ttitle left 'Size of DB at datafile level (rounded) ' skip left -
ttitle left '================================================================='
select sum(bytes)/power(1024,3) "db_size (mb)" 
from dba_data_files;

ttitle left 'Size of DB by schema owner at segment level (rounded) ' skip left -
ttitle left '================================================================='
select owner, sum(bytes)/power(1024,3) "segment_size (mb)" 
from dba_segments 
group by owner
order by 2;

