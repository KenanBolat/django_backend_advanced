from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.translation import gettext as _  # for translation
from . import models


class UserAdmin(admin.ModelAdmin):
    ordering = ('id',)
    list_display = ('email', 'name')
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        (_('Personal Info'), {'fields': ('name',)}),
        (_('Permissions'), {'fields': ('is_active', 'is_staff', 'is_superuser')}),
        (_('Important dates'), {'fields': ('last_login',)})
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2')
        }), # for create new user   (password1 and password2 are required)
    )


admin.site.register(models.User, UserAdmin)
admin.site.register(models.Tag)
