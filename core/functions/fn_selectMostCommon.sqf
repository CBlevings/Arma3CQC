/*
	Author: Poseidon
	
	Description: Provided with an array, it will return the most common element in that array
*/
private["_array"];
_array = _this param [0,[],[[]]];

if(count _array == 0) exitWith {};

_checkedElements = [];
_currentElementCount = 0;
_currentElement = 0;
_mostCommonElement = 0;
_mostCommonCount = 0;

for "_i" from 0 to ((count _array) - 1) do {
	if(!((_array select _i) in _checkedElements)) then {
		_currentElement = (_array select _i);
		_checkedElements pushBack _currentElement;
		_currentElementCount = 0;
	
		for "_c" from _i to ((count _array) - 1) do {
			if((_array select _c) isEqualTo _currentElement) then {
				_currentElementCount = _currentElementCount + 1;
				
				if(_currentElementCount >= _mostCommonCount) then {
					_mostCommonCount = _currentElementCount;
					_mostCommonElement = _currentElement;
				};
			};
		};
	};
};

_mostCommonElement