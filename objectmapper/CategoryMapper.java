package com.technocrats.creatingjoy.objectmapper;

import com.technocrats.creatingjoy.dto.CategoryDTO;
import com.technocrats.creatingjoy.dto.RoleDTO;
import com.technocrats.creatingjoy.entity.Category;
import com.technocrats.creatingjoy.entity.Role;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class CategoryMapper {

    @Autowired
    private ModelMapper mapper;

    public CategoryDTO convertToDto(Category theCategory){

        CategoryDTO theCategoryDto=mapper.map(theCategory,CategoryDTO.class);
        return theCategoryDto;

    }


    public Category convertToEntity(CategoryDTO theCategoryDto){

        Category theCategory=mapper.map(theCategoryDto,Category.class);
        return theCategory;

    }

}
