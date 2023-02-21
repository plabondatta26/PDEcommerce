echo "Build Start"
python3.7 -m pip install -r requirements.txt
python3.7 -m pip install -r migrate
python3.7 -m pip install -r collectstatic --noiput --clear
echo "Build End"
