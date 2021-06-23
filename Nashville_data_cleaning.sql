select * 
from PortfolioProjectYousif.dbo.NashvilleHousing

Select saleDateConverted, CONVERT(Date,SaleDate)
From PortfolioProjectYousif.dbo.NashvilleHousing


--Update NashvilleHousing
--SET SaleDate = CONVERT(Date,SaleDate)


ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

Update NashvilleHousing
SET SaleDateConverted = CONVERT(Date,SaleDate)

---------
-- Standardize Date Format


Select *
From PortfolioProjectYousif.dbo.NashvilleHousing
--where PropertyAddress is null
order by ParcelID

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull(a.PropertyAddress,b.PropertyAddress)
From PortfolioProjectYousif.dbo.NashvilleHousing a
join PortfolioProjectYousif.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[uniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

update a
set PropertyAddress = isnull(a.PropertyAddress,'No Address')
From PortfolioProjectYousif.dbo.NashvilleHousing a
join PortfolioProjectYousif.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[uniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null


Select PropertyAddress
From PortfolioProjectYousif.dbo.NashvilleHousing

--using substring and characcter index
select 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) as address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, len(PropertyAddress)) as address
From PortfolioProjectYousif.dbo.NashvilleHousing

--this does not work !! I have to execute each function indivually and it still gives an error about the substring moving to the left.

ALTER TABLE NashvilleHousing
Add PropertySplitAddress Nvarchar(255);

Update NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1)


ALTER TABLE NashvilleHousing
Add PropertySplitCity Nvarchar(255);

Update NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))

Select *
From PortfolioProjectYousif.dbo.NashvilleHousing

Select *
From PortfolioProjectYousif.dbo.NashvilleHousing

Select
PARSENAME(replace(owneraddress, ',','.'),3),
PARSENAME(replace(owneraddress, ',','.'),2),
PARSENAME(replace(owneraddress, ',','.'),1)

From PortfolioProjectYousif.dbo.NashvilleHousing

ALTER TABLE NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)


ALTER TABLE NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)

ALTER TABLE NashvilleHousing
Add OwnerSplitState Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)

Select *
From PortfolioProjectYousif.dbo.NashvilleHousing

select distinct (soldasVacant), count(soldasVacant)
from PortfolioProjectYousif.dbo.NashvilleHousing
Group by SoldAsVacant
order by 2

select SoldAsVacant,
case when SoldAsVacant = 'Y' then 'yes'	
	when SoldAsVacant = 'N' then 'No'
	else  SoldAsVacant
	end

from PortfolioProjectYousif.dbo.NashvilleHousing

Update NashvilleHousing
set SoldAsVacant = case when SoldAsVacant = 'Y' then 'yes'	
	when SoldAsVacant = 'N' then 'No'
	else  SoldAsVacant
	end

Select *
From PortfolioProjectYousif.dbo.NashvilleHousing


ALTER TABLE PortfolioProjectYousif.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate