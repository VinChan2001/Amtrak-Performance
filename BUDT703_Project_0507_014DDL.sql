USE BUDT703_Project_0507_14;

-- Drop tables in reverse order of dependencies
DROP TABLE IF EXISTS State_T;
DROP TABLE IF EXISTS Employment_T;
DROP TABLE IF EXISTS GoalsYoY_T;
DROP TABLE IF EXISTS GuestRewards_T;
DROP TABLE IF EXISTS Ridership_T;
DROP TABLE IF EXISTS Procurement_T;
DROP TABLE IF EXISTS Budget_T;
DROP TABLE IF EXISTS OTP_T;
DROP TABLE IF EXISTS Station_T;


-- Create State Table
CREATE TABLE State_T (
			  stateID CHAR(3) NOT NULL,
              stateName VARCHAR(50) NOT NULL,
       CONSTRAINT pk_State_stateID PRIMARY KEY(stateID)
	   );

-- Create Station Table
CREATE TABLE Station_T (
    stationCode CHAR(3) NOT NULL,
    stationCity VARCHAR(100),
    stationUrl VARCHAR(100),
	stationStateID CHAR(3),
	CONSTRAINT pk_Station PRIMARY KEY (stationCode, stationCity),
	CONSTRAINT fk_Station_StateID FOREIGN KEY (stationStateID)
        REFERENCES State_T (stateID)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

-- Create Budget Table
CREATE TABLE Budget_T (
    budgetId DECIMAL(5,0) NOT NULL,
    budgetType VARCHAR(50),
    budgetPlanYear VARCHAR(50),
    budgetStationName VARCHAR(100) NOT NULL,
	budgetStationCode CHAR(3) NOT NULL,
    budgetBudget DECIMAL(10, 2),
    budgetPriorYears DECIMAL(10, 2),
    budgetFY23 DECIMAL(10, 2),
    budgetFY24 DECIMAL(10, 2),
    budgetFY25 DECIMAL(10, 2),
    budgetFY26 DECIMAL(10, 2),
    CONSTRAINT pk_Budget_budgetId PRIMARY KEY (budgetId),
	CONSTRAINT fk_Budget_Station FOREIGN KEY (budgetStationCode, budgetStationName)
        REFERENCES Station_T (stationCode, stationCity)
        ON DELETE NO ACTION ON UPDATE CASCADE
    );

-- Create OTP Table
CREATE TABLE OTP_T (
    otpId DECIMAL(5,0) NOT NULL,
    otpStateID CHAR(3) NOT NULL,
    otpType VARCHAR(15),
    otpRoute VARCHAR(300),
    otpStations VARCHAR(150),
    otpHostRailroads VARCHAR(100),
    otpFY21otp DECIMAL(5, 3),
    otpFY22otp DECIMAL(5, 3),
    otpFY23otp DECIMAL(5, 3),
    CONSTRAINT pk_OTP_otpId PRIMARY KEY (otpId),
	CONSTRAINT fk_OTP_otpStateID FOREIGN KEY (otpStateID)
        REFERENCES State_T (stateID)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

-- Create GuestRewards Table
CREATE TABLE GuestRewards_T (
    guestRewardsStateID CHAR(3) NOT NULL,
    guestRewardsFY21 DECIMAL(8, 0),
    guestRewardsFY22 DECIMAL(8, 0),
    guestRewardsFY23 DECIMAL(8, 0),
    CONSTRAINT pk_GuestRewards_guestRewardsStateName PRIMARY KEY (guestRewardsStateID),
	CONSTRAINT fk_GuestRewards_guestRewardsStateID FOREIGN KEY (guestRewardsStateID)
        REFERENCES State_T (stateID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

-- Create Ridership Table
CREATE TABLE Ridership_T (
    ridershipId DECIMAL(5,0) NOT NULL,
    ridershipStationCode CHAR(3) NOT NULL,
    ridershipStateID CHAR(3) NOT NULL,
    ridershipFY21 DECIMAL(8, 0),
    ridershipFY22 DECIMAL(8, 0),
    ridershipFY23 DECIMAL(8, 0),
    CONSTRAINT pk_Ridership_ridershipId PRIMARY KEY (ridershipId, ridershipStationCode),
	CONSTRAINT fk_Ridership_ridershipStateID FOREIGN KEY (ridershipStateID)
        REFERENCES State_T (stateID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

-- Create Procurement Table
CREATE TABLE Procurement_T (
    procurementStateID CHAR(3) NOT NULL,
    procurementStationCity VARCHAR(50),
    procurementFY21 DECIMAL(8, 0),
    procurementFY22 DECIMAL(8, 0),
    procurementFY23 DECIMAL(8, 0),
    CONSTRAINT pk_Procurement_procurementId PRIMARY KEY (procurementStateID),
	CONSTRAINT fk_Procurement_StateID FOREIGN KEY (procurementStateID)
        REFERENCES State_T (stateID)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

-- Create Employment Table
CREATE TABLE Employment_T (
    employmentStateStateID CHAR(3) NOT NULL,
    employmentFY21 DECIMAL(12, 0),
    employmentFY22 DECIMAL(12, 0),
    employmentFY23 DECIMAL(12, 0),
    employment0FY21 DECIMAL(12, 2),
    employment0FY22 DECIMAL(12, 2),
    employment0FY23 DECIMAL(12, 2),
    CONSTRAINT pk_Employment PRIMARY KEY (employmentStateStateID),
    CONSTRAINT fk_Employment_State FOREIGN KEY (employmentStateStateID)
        REFERENCES State_T (stateID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

-- Create GoalsYoY Table
CREATE TABLE GoalsYoY_T (
    GoalsYoYStateID CHAR(3) NOT NULL,
    GoalsYoYRidership DECIMAL(18, 2),
    GoalsYoYOTP DECIMAL(18, 2),
    CONSTRAINT pk_GoalsYoY_GoalsYoYStateName PRIMARY KEY (GoalsYoYStateID),
	CONSTRAINT fk_GoalsYoY_State FOREIGN KEY (GoalsYoYStateID)
        REFERENCES State_T (stateID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

-- insert statements

-- state table
INSERT INTO State_T (stateName, stateID) VALUES ('Alabama', '000');
INSERT INTO State_T (stateName, stateID) VALUES ('Arizona', '003');
INSERT INTO State_T (stateName, stateID) VALUES ('Arkansas', '010');
INSERT INTO State_T (stateName, stateID) VALUES ('British Columbia (Canada)', '016');
INSERT INTO State_T (stateName, stateID) VALUES ('California', '017');
INSERT INTO State_T (stateName, stateID) VALUES ('Colorado', '092');
INSERT INTO State_T (stateName, stateID) VALUES ('Connecticut', '102');
INSERT INTO State_T (stateName, stateID) VALUES ('Delaware', '115');
INSERT INTO State_T (stateName, stateID) VALUES ('District of Columbia', '117');
INSERT INTO State_T (stateName, stateID) VALUES ('Florida', '118');
INSERT INTO State_T (stateName, stateID) VALUES ('Georgia', '136');
INSERT INTO State_T (stateName, stateID) VALUES ('Idaho', '141');
INSERT INTO State_T (stateName, stateID) VALUES ('Illinois', '142');
INSERT INTO State_T (stateName, stateID) VALUES ('Indiana', '172');
INSERT INTO State_T (stateName, stateID) VALUES ('Iowa', '182');
INSERT INTO State_T (stateName, stateID) VALUES ('Kansas', '188');
INSERT INTO State_T (stateName, stateID) VALUES ('Kentucky', '194');
INSERT INTO State_T (stateName, stateID) VALUES ('Louisiana', '198');
INSERT INTO State_T (stateName, stateID) VALUES ('Maine', '205');
INSERT INTO State_T (stateName, stateID) VALUES ('Maryland', '211');

-- station table
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('ATN', 'Anniston, AL', 'https://www.greatamericanstations.com/stations/anniston-al-atn/', '000');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('BEN', 'Benson, AZ', 'https://www.greatamericanstations.com/stations/benson-az-ben/', '003');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('ARK', 'Arkadelphia, AR', 'https://www.greatamericanstations.com/stations/arkadelphia-ar-ark/', '010');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('VAC', 'Vancouver, BC � Pacific Central Station', 'https://www.greatamericanstations.com/stations/vancouver-bc-vac/', '016');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('ANA', 'Anaheim, CA � Regional Transportation Intermodal Center', 'https://www.greatamericanstations.com/stations/anaheim-ca-ana/', '017');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('DEN', 'Denver, CO � Union Station', 'https://www.greatamericanstations.com/stations/denver-co-den/', '092');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('BER', 'Berlin, CT', 'https://www.greatamericanstations.com/stations/berlin-ct-ber/', '102');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('NRK', 'Newark, DE � Thomas R. Carper Station', 'https://www.greatamericanstations.com/stations/newark-de-nrk/', '115');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('WAS', 'Washington, DC � Union Station', 'https://www.greatamericanstations.com/stations/washington-union-station-dc-was/', '117');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('DFB', 'Deerfield Beach, FL', 'https://www.greatamericanstations.com/stations/deerfield-beach-fl-dfb/', '118');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('ATL', 'Atlanta, GA', 'https://www.greatamericanstations.com/stations/atlanta-ga-atl/', '136');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('SPT', 'Sandpoint, ID', 'https://www.greatamericanstations.com/stations/sandpoint-id-spt/', '141');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('ALN', 'Alton, IL', 'https://www.greatamericanstations.com/stations/alton-il-aln/', '142');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('COI', 'Connersville, IN', 'https://www.greatamericanstations.com/stations/connersville-in-coi/', '172');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('BRL', 'Burlington, IA', 'https://www.greatamericanstations.com/stations/burlington-ia-brl/', '182');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('DDG', 'Dodge City, KS', 'https://www.greatamericanstations.com/stations/dodge-city-ks-ddg/', '188');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('AKY', 'Ashland, KY', 'https://www.greatamericanstations.com/stations/ashland-ky-aky/', '194');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('HMD', 'Hammond, LA', 'https://www.greatamericanstations.com/stations/hammond-la-hmd/', '198');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('BRK', 'Brunswick, ME', 'https://www.greatamericanstations.com/stations/brunswick-me-brk/', '205');
INSERT INTO Station_T (stationCode, stationCity, stationUrl, stationStateID) VALUES ('ABE', 'Aberdeen, MD', 'https://www.greatamericanstations.com/stations/aberdeen-md-abe/', '211');


-- budget table
INSERT INTO Budget_T (budgetId, budgetType, budgetPlanYear, budgetStationName, budgetStationCode, budgetBudget, budgetPriorYears, budgetFY23, budgetFY24, budgetFY25, budgetFY26) VALUES (1, 'Design', 'FY16', 'Atlanta, GA', 'ATL', 709000, 658000.0, 0, 51000, 0, 0);
INSERT INTO Budget_T (budgetId, budgetType, budgetPlanYear, budgetStationName, budgetStationCode, budgetBudget, budgetPriorYears, budgetFY23, budgetFY24, budgetFY25, budgetFY26) VALUES (27, 'Design', 'FY21', 'Anniston, AL', 'ATN', 591000, 62000.0, 461000, 69000, 0, 0);
INSERT INTO Budget_T (budgetId, budgetType, budgetPlanYear, budgetStationName, budgetStationCode, budgetBudget, budgetPriorYears, budgetFY23, budgetFY24, budgetFY25, budgetFY26) VALUES (61, 'Design', 'FY22', 'Arkadelphia, AR', 'ARK', 247000, 224000.0, 23000, 0, 0, 0);
INSERT INTO Budget_T (budgetId, budgetType, budgetPlanYear, budgetStationName, budgetStationCode, budgetBudget, budgetPriorYears, budgetFY23, budgetFY24, budgetFY25, budgetFY26) VALUES (62, 'Design', 'FY22', 'Benson, AZ', 'BEN', 223000, 129000.0, 94000, 0, 0, 0);
INSERT INTO Budget_T (budgetId, budgetType, budgetPlanYear, budgetStationName, budgetStationCode, budgetBudget, budgetPriorYears, budgetFY23, budgetFY24, budgetFY25, budgetFY26) VALUES (74, 'Design', 'FY22', 'Hammond, LA', 'HMD', 301000, 135000.0, 166000, 0, 0, 0);
INSERT INTO Budget_T (budgetId, budgetType, budgetPlanYear, budgetStationName, budgetStationCode, budgetBudget, budgetPriorYears, budgetFY23, budgetFY24, budgetFY25, budgetFY26) VALUES (165, 'Construction', 'FY22', 'Connersville, IN', 'COI', 118100, 201000.0, 980000, 0, 0, 0);


-- otp table
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (1, '000', 'Long Distance', 'Crescent', 'daily New York-Washington-Charlottesville-Charlotte-Atlanta-Birmingham-New Orleans', 'Norfolk Southern', 0.546, 0.53, 0.57);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (2, '003', 'Long Distance', 'Southwest Chief', 'daily Los Angeles-Flagstaff-Albuquerque-Topeka-Chicago', 'BNSF, New Mexico DOT', 0.363, 0.28, 0.34);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (5, '010', 'Long Distance', 'Texas Eagle', 'daily Chicago-St. Louis-Little Rock-Dallas-San Antonio with thrice weekly through car service on the Sunset Limited to Los Angeles', 'BNSF, Canadian National, Union Pacific, Trinity Railway Express', 0.52, 0.49, 0.6);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (6, '017', 'Long Distance', 'California Zephyr', 'daily San Francisco Bay Area-Reno-Salt Lake City-Denver-Omaha-Chicago', 'BNSF, Union Pacific', 0.376, 0.29, 0.33);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (14, '092', 'Long Distance', 'California Zephyr', 'daily San Francisco Bay Area-Reno-Salt Lake City-Denver-Omaha-Chicago', 'BNSF, Union Pacific', 0.376, 0.29, 0.33);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (21, '117', 'Long Distance', 'Capitol Limited', 'daily Chicago-Toledo-Cleveland-Pittsburgh-Washington', 'CSX, Norfolk Southern', 0.287, 0.32, 0.7);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (31, '115', 'Long Distance', 'Cardinal', 'thrice weekly New York-Washington-CharloZesville-Charleston-Cincinnati-Indianapolis-Chicago', 'CSX, Norfolk Southern, Buckingham Branch Railroad', 0.541, 0.48, 0.58);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (40, '118', 'Long Distance', 'Auto Train', 'daily Lorton-Sanford', 'CSX, Florida Central Rail Corridor', 0.56, 0.36, 0.66);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (43, '136', 'Long Distance', 'Crescent', 'daily New York-Washington-Charlottesville-Charlotte-Atlanta-Birmingham-New Orleans', 'Norfolk Southern', 0.546, 0.53, 0.57);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (47, '141', 'Long Distance', 'Empire Builder', 'daily Chicago-St. Paul-Seattle/Portland', 'BNSF, Canadian Pacific, Metra', 0.593, 0.48, 0.51);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (48, '142', 'Long Distance', 'California Zephyr', 'daily San Francisco Bay Area-Reno-Salt Lake City-Denver-Omaha-Chicago', 'BNSF, Union Pacific', 0.376, 0.29, 0.33);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (63, '172', 'Long Distance', 'Capitol Limited', 'daily Chicago-Toledo-Cleveland-Pittsburgh-Washington', 'CSX, Norfolk Southern', 0.287, 0.32, 0.7);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (66, '182', 'Long Distance', 'California Zephyr', 'daily San Francisco Bay Area-Reno-Salt Lake City-Denver-Omaha-Chicago', 'BNSF, Union Pacific', 0.376, 0.29, 0.33);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (68, '188', 'Long Distance', 'Southwest Chief', 'daily Los Angeles-Flagstaff-Albuquerque-Topeka-Chicago', 'BNSF, New Mexico DOT', 0.363, 0.28, 0.34);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (69, '194', 'Long Distance', 'Cardinal', 'thrice weekly New York-Washington-Charlottesville-Charleston-Cincinnati-Indianapolis-Chicago', 'CSX, Norfolk Southern, Buckingham Branch Railroad', 0.541, 0.48, 0.58);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (71, '198', 'Long Distance', 'City of New Orleans', 'daily Chicago-Carbondale-Memphis-New Orleans', 'Canadian National', 0.85, 0.6, 0.75);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (74, '205', 'State Supported', 'Downeaster', 'five daily round-trips Boston-Portland, of which two round-trips operate to/from Brunswick', 'Massachusetts Bay Transportation Authority, Pan Am Railways', 0.751, 0.82, 0.81);
INSERT INTO OTP_T (otpId, otpStateID, otpType, otpRoute, otpStations, otpHostRailroads, otpFY21otp, otpFY22otp, otpFY23otp) VALUES (75, '211', 'Long Distance', 'Capitol Limited', 'daily Chicago-Toledo-Cleveland-Pittsburgh-Washington', 'CSX, Norfolk Southern', 0.287, 0.32, 0.7);


-- guest rewards
INSERT INTO GuestRewards_T (guestRewardsStateID, guestRewardsFY21, guestRewardsFY22, guestRewardsFY23) VALUES ('000', 36069, 50452, 58084);
INSERT INTO GuestRewards_T (guestRewardsStateID, guestRewardsFY21, guestRewardsFY22, guestRewardsFY23) VALUES ('003', 75061, 93961, 105213);
INSERT INTO GuestRewards_T (guestRewardsStateID, guestRewardsFY21, guestRewardsFY22, guestRewardsFY23) VALUES ('010', 21101, 26133, 29331);
INSERT INTO GuestRewards_T (guestRewardsStateID, guestRewardsFY21, guestRewardsFY22, guestRewardsFY23) VALUES ('017', 1267668, 1675724, 1874607);
INSERT INTO GuestRewards_T (guestRewardsStateID, guestRewardsFY21, guestRewardsFY22, guestRewardsFY23) VALUES ('092', 85131, 107905, 121412);
INSERT INTO GuestRewards_T (guestRewardsStateID, guestRewardsFY21, guestRewardsFY22, guestRewardsFY23) VALUES ('102', 200665, 254160, 291690);
INSERT INTO GuestRewards_T (guestRewardsStateID, guestRewardsFY21, guestRewardsFY22, guestRewardsFY23) VALUES ('117', 168859, 201075, 228469);
INSERT INTO GuestRewards_T (guestRewardsStateID, guestRewardsFY21, guestRewardsFY22, guestRewardsFY23) VALUES ('115', 63160, 76621, 89281);
INSERT INTO GuestRewards_T (guestRewardsStateID, guestRewardsFY21, guestRewardsFY22, guestRewardsFY23) VALUES ('118', 402806, 479421, 542543);
INSERT INTO GuestRewards_T (guestRewardsStateID, guestRewardsFY21, guestRewardsFY22, guestRewardsFY23) VALUES ('136', 100365, 124613, 141254);

--ridership
INSERT INTO Ridership_T (ridershipId, ridershipStationCode, ridershipStateID, ridershipFY21, ridershipFY22, ridershipFY23)
VALUES (1, 'ANA', '017', 7859848, 12847910, 10573082),
       (2, 'DEN', '092', 3101431, 12863474, 28225643),
       (3, 'NRK', '115', 675675, 815758, 1634977),
       (4, 'ATL', '136', 16493897, 92303457, 67965646),
       (5, 'ABE', '211', NULL, NULL, 126798),
       (6, 'BRL', '182', 1157352, 1606682, 1865253),
       (7, 'BER', '102', NULL, 168031, 1036566);



--procurement
INSERT INTO Procurement_T (procurementStateID, procurementStationCity, procurementFY21, procurementFY22, procurementFY23) VALUES ('017', 'Anaheim', 7859848, 12847910, 10573082);
INSERT INTO Procurement_T (procurementStateID, procurementStationCity, procurementFY21, procurementFY22, procurementFY23) VALUES ('092', 'Denver', 3101431, 12863474, 28225643);
INSERT INTO Procurement_T (procurementStateID, procurementStationCity, procurementFY21, procurementFY22, procurementFY23) VALUES ('115', 'Newark', 675675, 815758, 1634977);
INSERT INTO Procurement_T (procurementStateID, procurementStationCity, procurementFY21, procurementFY22, procurementFY23) VALUES ('136', 'Atlanta', 16493897, 92303457, 67965646);
INSERT INTO Procurement_T (procurementStateID, procurementStationCity, procurementFY21, procurementFY22, procurementFY23) VALUES ('211', 'Aberdeen', 0, 0, 126798);
INSERT INTO Procurement_T (procurementStateID, procurementStationCity, procurementFY21, procurementFY22, procurementFY23) VALUES ('102', 'Berlin', 0, 168031, 1036566);



--employement
INSERT INTO Employment_T (employmentStateStateID, employmentFY21, employmentFY22, employmentFY23, employment0FY21, employment0FY22, employment0FY23) 
VALUES 
('000', 13, 15, 27, 1292695.0, 1976833.0, 1983661.0),
('003', 12, 15, 28, 1889753.0, 1466911.0, 2460877.0),
('010', 26, 28, 31, 2876205.0, 3183395.0, 2646581.0),
('017', 1842, 1809, 2056, 161770256.0, 175959691.0, 185233855.0),
('092', 58, 65, 76, 5733988.0, 7819320.0, 8674629.0),
('102', 682, 747, 897, 66324721.0, 75425136.0, 88290917.0),
('117', 236, 251, 338, 44992481.0, 31037614.0, 37823087.0),
('115', 1004, 1072, 1331, 91684576.0, 106469998.0, 125365808.0),
('118', 594, 659, 763, 52083356.0, 59233552.0, 67789558.0),
('136', 66, 80, 89, 8379702.0, 9973770.0, 11977363.0);

--goals
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('102', 17650000, 0.90);
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('205', 17650000, 0.90);
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('000', 4960000, 0.70); -- Alabama
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('003', 4960000, 0.70); -- Arizona
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('010', 4960000, 0.70); -- Arkansas
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('017', 4960000, 0.70); -- California
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('092', 4960000, 0.70); -- Colorado
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('117', 4960000, 0.70); -- District of Columbia
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('115', 4960000, 0.70); -- Delaware
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('118', 4960000, 0.70); -- Florida
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('136', 4960000, 0.70); -- Georgia
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('141', 4960000, 0.70); -- Idaho
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('142', 4960000, 0.70); -- Illinois
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('172', 4960000, 0.70); -- Indiana
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('182', 4960000, 0.70); -- Iowa
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('188', 4960000, 0.70); -- Kansas
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('194', 4960000, 0.70); -- Kentucky
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('198',4960000, 0.70); -- Louisiana
INSERT INTO GoalsYoY_T (GoalsYoYStateID, GoalsYoYRidership, GoalsYoYOTP) VALUES ('211', 4960000, 0.70); -- Maryland



SELECT * FROM State_T;
SELECT * FROM Station_T;
SELECT * FROM Budget_T;
SELECT * FROM OTP_T;
SELECT * FROM GuestRewards_T;
SELECT * FROM Ridership_T;
SELECT * FROM Procurement_T;
SELECT * FROM Employment_T;
SELECT * FROM GoalsYoY_T;

-- DML

--To identify high traffic stations and analyze demand fluctuations.

SELECT r.ridershipStationCode AS StationCode,
    s.stationCity AS StationCity,
    s.stationStateID AS StateID,
    r.ridershipFY21,
    r.ridershipFY22,
    r.ridershipFY23,
    (r.ridershipFY23 - r.ridershipFY21) AS DemandFluctuation
FROM Ridership_T r JOIN Station_T s ON r.ridershipStationCode = s.stationCode
ORDER BY DemandFluctuation DESC; 

-- To identify states that are meeting/not meeting/exceeding ridership goals compared to actual performance for FY23

SELECT g.GoalsYoYStateID AS StateID,
       s.stateName AS StateName,
       g.GoalsYoYRidership AS GoalFY23Ridership,
       SUM(r.ridershipFY23) AS ActualFY23Ridership,
       CASE 
           WHEN SUM(r.ridershipFY23) < g.GoalsYoYRidership THEN 'Not Meeting'
           WHEN SUM(r.ridershipFY23) = g.GoalsYoYRidership THEN 'Meeting'
           WHEN SUM(r.ridershipFY23) > g.GoalsYoYRidership THEN 'Exceeding'
       END AS PerformanceStatus
FROM GoalsYoY_T g JOIN State_T s ON g.GoalsYoYStateID = s.stateID
	JOIN 
    Ridership_T r ON r.ridershipStateID = g.GoalsYoYStateID
GROUP BY g.GoalsYoYStateID, s.stateName, g.GoalsYoYRidership;

-- To identify the top 10 states that have the highest improvement in OTP with the least increase in procurement

SELECT o.otpStateID AS StateID,
       s.stateName AS StateName,
       (o.otpFY23otp - o.otpFY21otp) AS OTPImprovement,
       (p.procurementFY23 - p.procurementFY21) AS ProcurementIncrease
FROM OTP_T o JOIN Procurement_T p ON o.otpStateID = p.procurementStateID JOIN State_T s ON o.otpStateID = s.stateID
WHERE o.otpFY23otp > o.otpFY21otp 
ORDER BY OTPImprovement DESC, ProcurementIncrease ASC

-- To identify the top 10 states with the highest employee-to-ridership impact

-- To identify whether changes in employees over the years led to changes in ridership
SELECT e.employmentStateStateID AS StateID,
		s.stateName AS StateName,
		(e.employmentFY23 - e.employmentFY21) AS EmployeeChange,
		(SUM(r.ridershipFY23) - SUM(r.ridershipFY21)) AS RidershipChange,
		CASE 
		 WHEN (e.employmentFY23 - e.employmentFY21) > 0 AND (SUM(r.ridershipFY23) - SUM(r.ridershipFY21)) > 0 THEN 'Positive Correlation'
		 WHEN (e.employmentFY23 - e.employmentFY21) < 0 AND (SUM(r.ridershipFY23) - SUM(r.ridershipFY21)) < 0 THEN 'Positive Correlation'
		 WHEN (e.employmentFY23 - e.employmentFY21) * (SUM(r.ridershipFY23) - SUM(r.ridershipFY21)) < 0 THEN 'Negative Correlation'
		 ELSE 'No Significant Change'
		END AS Correlation
FROM Employment_T e JOIN Ridership_T r ON e.employmentStateStateID = r.ridershipStateID
	JOIN State_T s ON e.employmentStateStateID = s.stateID
GROUP BY e.employmentStateStateID, s.stateName, e.employmentFY23, e.employmentFY21
HAVING (SUM(r.ridershipFY23) - SUM(r.ridershipFY21)) IS NOT NULL
ORDER BY ABS(SUM(r.ridershipFY23) - SUM(r.ridershipFY21)) DESC, ABS(e.employmentFY23 - e.employmentFY21) DESC;





