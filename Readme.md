# Item Action HUD
This project written by MBL

## Start
First of all, you should set the imagePatch variable in the first line of the index.js file according to your inventory file. (This is a very easy process.)

```
Like;

let imagePatch = "nui://ox-inventory/assets/images/${data.name}.png"

```



# Requirements

No Requirements, this script is working with All framework. [STANDALONE]

![Preview](<background v1.png>)

# How can I use this script?


# AddItem event;

--
# Server export;
TriggerClientEvent("ItemInfo", source, type, itemName, itemLabel, count) 
# Client Export;
TriggerEvent("ItemInfo", type, itemName, itemLabel, count) 

# Description
Source = Player ID,
type = Type must be "added" or "removed" or "use"
itemName = item hash
itemLabel = Label of item
count = count for remove or add functon. Don't use it on use Trigger.

# Use export
# TriggerEvent("ItemInfo", "use", itemName, itemLabel)
# Require Export
# ["Client"] = {
#     TriggerEvent("addtoReq", coords, reqItemName, reqItemLabel, reqCount)
# },
# ["Server] = {
#     TriggerClientEvent("addtoReq", source, coords, reqItemName, reqItemLabel, reqCount)
# }
  

