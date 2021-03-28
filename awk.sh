BEGIN{
start_new_file=0
timestep=0
folder_num=0
folder_step=1000000
read_flag=0
}

{
if ($1=="ITEM:" && $2=="TIMESTEP"){
start_new_file=1
read_flag=0
}
else if (start_new_file==1) {
timestep=$1
if (timestep >= folder_num + folder_step) {
folder_num += folder_step
} 
start_new_file=0
}

else if ($1=="ITEM:" && $2=="ATOMS"){
read_flag=1
for (i = 3; i < 8; i++) {
printf "%s ",$i > "timesteps_tables_"folder_num"/"timestep".txt"
}
printf "\n" >> "timesteps_tables_"folder_num"/"timestep".txt"
}
 
else if (read_flag==1) {
printf "%d ",$1 >> "timesteps_tables_"folder_num"/"timestep".txt"
printf "%d ",$2 >> "timesteps_tables_"folder_num"/"timestep".txt"
for (i = 3; i < 6; i++) {
printf "%f ",$i >> "timesteps_tables_"folder_num"/"timestep".txt"
}
printf "\n" >> "timesteps_tables_"folder_num"/"timestep".txt"
}
}

END{

}
