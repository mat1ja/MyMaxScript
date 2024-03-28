macroScript Macro1
	category:"DragAndDrop"
	toolTip:""
(
	        function add_chamfer_fnc radius glass = (
	            
	            radius = radius / 10
	            segments = 4
	            depth = 0.5
	            
	            if(glass == true) then
	            (
	                segments = 1
	                depth = 0
	            )
	                           
	            for obj in objects where obj.isselected == true do
	            (

	                    c = chamfer()
	                    addModifier obj c
	                    c.amount = radius --set the Amount to 5.0
	                    c.segments = segments --set the Segments to 5
	                    c.depth = depth
	                    c.tension = 0.5 --set the Tension to 0.5 to curve the new faces
	                    c.SmoothType = 1
	                    c.smoothtoadjacent = on
	            )
	            
	        )
	        function rotate_object axis rotate_copy = (
	            
	            x = 0
	            y = 0
	            z = 0
	            if (axis == "x") then
	                x = 90
	            if (axis == "y") then
	                y = 90
	            
	            if (axis == "z") then
	                z = 90
	            
	            if rotate_copy == true then
	            (
	                object_tmp = for myobj in (selection as array) collect (copy myobj )
	                select object_tmp
	            )
	            else
	            (
	                object_tmp = $
	            )
	            
	            transform_matrix = inverse(viewport.getTM())
	            in coordsys transform_matrix
	                
	            for obj in objects where obj.isselected == true do
	            (
	                rotate object_tmp (EulerAngles x y z)
	            )
	            
	            -- newNodes = for myobj in (selection as array) collect (instance myobj )
	            
	            
	        )
	        function translate_object axis length = (
	            x = 0
	            y = 0
	            z = 0
	            if (axis == "x") then
	                x = length
	            if (axis == "y") then
	                y = length
	            transform_matrix = inverse(viewport.getTM())
	            for obj in objects where obj.isselected == true and (classof obj == PolyMeshObject) do
	            (
	                polyobj = modpanel.getcurrentobject() 
	                polyobj.getSelection  #Vertex
	                polyobj.SetOperation #Transform
	                polyobj.MoveSelection [x,y,z] axis:transform_matrix
	                polyobj.Commit()
	                redrawviews()
	            )   
	        )
	            
	            
	        rollout matijaRollout "Modeliranje" width:162 height:610
	        (
	            button 'move_x_minus_3' "-3mm" pos:[13,55] width:41 height:23 align:#left
	            button 'move_x_plus_3' "+3mm" pos:[13,26] width:41 height:23 align:#left
	            button 'move_y_minus_3' "-3mm" pos:[13,146] width:41 height:23 align:#left
	            button 'move_y_plus_3' "+3mm" pos:[13,117] width:41 height:23 align:#left
	            button 'move_x_minus_5' "-5mm" pos:[60,55] width:41 height:23 align:#left
	            button 'move_x_plus_5' "+5mm" pos:[60,26] width:41 height:23 align:#left
	            button 'move_y_minus_5' "-5mm" pos:[60,146] width:41 height:23 align:#left
	            button 'move_y_plus_5' "+5mm" pos:[60,117] width:41 height:23 align:#left
	            button 'move_x_minus_15' "-15mm" pos:[106,55] width:41 height:23 align:#left
	            button 'move_x_plus_15' "+15mm" pos:[106,26] width:41 height:23 align:#left
	            button 'move_y_minus_15' "-15mm" pos:[106,146] width:41 height:23 align:#left
	            button 'move_y_plus_15' "+15mm" pos:[106,117] width:41 height:23 align:#left
	            
	            button 'fronte_button' "OK" pos:[19,574] width:121 height:22 align:#left
	            
	            button 'rotate_z' "Z" pos:[16,227] width:32 height:25 align:#left
	            button 'rotate_y' "Y" pos:[63,228] width:32 height:25 align:#left
	            button 'rotate_x' "X" pos:[112,228] width:32 height:25 align:#left
	            
	            button 'Copy_btn' "Kopiranje" pos:[14,289] width:60 height:25 align:#left
	            button 'instance_btn' "Instanca" pos:[84,290] width:64 height:25 align:#left
	            
	            button 'chamfer_add' "Standard" pos:[14,390] width:60 height:25 align:#left
	            button 'chamfer_glass' "Glass" pos:[84,391] width:64 height:25 align:#left
	            button 'chamfer_on' "ON" pos:[13,423] width:60 height:25 align:#left
	            button 'chamfer_off' "OFF" pos:[83,424] width:64 height:25 align:#left
	            
	            checkbox 'rotate_copy' "Kopiraj" pos:[16,204] width:115 height:19 checked:true align:#left
	            
	            
	            spinner 'spn1' "" pos:[17,504] width:128 height:16 range:[0,50,2] type:#integer scale:0.1 align:#left
	            spinner 'spn2' "" pos:[17,547] width:128 height:16 range:[0,100,3] type:#float scale:0.1 align:#left
	            spinner 'chamfer_radius' "" pos:[18,364] width:128 height:16 range:[0,100,2] type:#float scale:0.1 align:#left
	            
	            GroupBox 'grp1' "Pomak X-os" pos:[4,4] width:154 height:86 align:#left
	            GroupBox 'grp4' "Pomak Y-os" pos:[4,95] width:154 height:86 align:#left
	            GroupBox 'grp9' "Fronte" pos:[4,466] width:154 height:137 align:#left
	            GroupBox 'grp11' "Rotacija" pos:[4,186] width:154 height:75 align:#left
	            GroupBox 'grp23' "Kopiranje" pos:[4,268] width:154 height:53 align:#left
	            GroupBox 'grp29' "Chamfer" pos:[4,326] width:154 height:134 align:#left
	            
	            label 'lbl5' "Broj podjela" pos:[14,487] width:59 height:16 align:#left
	            label 'lbl3' "Razmak (mm)" pos:[14,529] width:79 height:16 align:#left
	            label 'lbl17' "Radijus (mm)" pos:[15,346] width:79 height:16 align:#left
	            
	            
	            on move_x_minus_3 pressed do
	            (   
	                translate_object "x" -0.3 
	                
	            )
	            on move_x_plus_3 pressed do
	            (   
	                translate_object "x" 0.3      
	                
	            )
	            on move_y_minus_3 pressed do
	            (   
	                translate_object "y" -0.3     
	                
	            )
	            on move_y_plus_3 pressed do
	            (
	                translate_object "y" 0.3      
	            )
	            on move_x_minus_5 pressed do
	            (   
	                translate_object "x" -0.5 
	                
	            )
	            on move_x_plus_5 pressed do
	            (   
	                translate_object "x" 0.5      
	                
	            )
	            on move_y_minus_5 pressed do
	            (   
	                translate_object "y" -0.5     
	                
	            )
	            on move_y_plus_5 pressed do
	            (
	                translate_object "y" 0.5      
	            )
	            on move_x_minus_15 pressed do
	            (   
	                translate_object "x" -1.5 
	                
	            )
	            on move_x_plus_15 pressed do
	            (   
	                translate_object "x" 1.5      
	                
	            )
	            on move_y_minus_15 pressed do
	            (   
	                translate_object "y" -1.5     
	                
	            )
	            on move_y_plus_15 pressed do
	            (
	                translate_object "y" 1.5  
	            )
	            on fronte_button pressed do
	            (
	                for obj in objects where obj.isselected == true and (classof obj == PolyMeshObject) do
	                (
	                    tmp_dist = spn2.value / 2 / 10
	                    $.modifiers[#Edit_Poly].ButtonOp #SelectEdgeRing
	                    $.modifiers[#Edit_Poly].connectEdgeSegments = spn1.value
	                    $.modifiers[#Edit_Poly].ButtonOp #ConnectEdges
	                    $.modifiers[#Edit_Poly].chamferEdgeAmount = tmp_dist
	                    $.modifiers[#Edit_Poly].edgeChamferMiteringType = 1
	                    $.modifiers[#Edit_Poly].chamferEdgeOpen = on
	                    $.modifiers[#Edit_Poly].edgeChamferInvert = off
	                    $.modifiers[#Edit_Poly].ButtonOp #ChamferEdge 
	                    macros.run "PolyTools" "OpenSelect"
	                    $.modifiers[#Edit_Poly].ButtonOp #Cap   
	                )
	            )
	            on rotate_z pressed do
	            (   
	                rotate_object "z" rotate_copy.state
	                
	            )
	            on rotate_y pressed do
	            (   
	                rotate_object "y" rotate_copy.state
	                
	            )
	            on rotate_x pressed do
	            (   
	                rotate_object "x" rotate_copy.state
	                
	            )
	            on Copy_btn pressed do
	            (   
	                object_tmp = for myobj in (selection as array) collect (copy myobj )
	                select object_tmp
	                
	            )
	            on instance_btn pressed do
	            (   
	                object_tmp = for myobj in (selection as array) collect (instance myobj )
	                select object_tmp
	                
	            )
	            on chamfer_add pressed do
	            (
	                add_chamfer_fnc chamfer_radius.value false
	            )
	            on chamfer_glass pressed do
	            (   
	                add_chamfer_fnc chamfer_radius.value true
	                
	            )
	            on chamfer_on pressed do
	            (   
	                
	                all_objects=$* as array
	                for obj in all_objects do(
	                    if obj.modifiers[#Chamfer] != undefined then
	                        obj.modifiers[#Chamfer].enabled = true  
	                )
	                        
	            )
	            on chamfer_off pressed do
	            (   
	                all_objects=$* as array
	                for obj in all_objects do(
	                    if obj.modifiers[#Chamfer] != undefined then
	                        obj.modifiers[#Chamfer].enabled = false 
	                )
	                
	            )
	        )
			
			createDialog matijaRollout
)
